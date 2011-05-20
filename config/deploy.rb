# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

# Load RVM's capistrano plugin.    
require "rvm/capistrano"

set :rvm_ruby_string, '1.9.2'
set :rvm_type, :user  # Don't use system-wide RVM

require 'bundler/capistrano'

set :application, 'dieselcrankshafts.com'

if ENV['staging']
  set :domain, "staging.kaixinbide.com"
else
  set :domain, "50.57.69.238"
end

set :user, 'deploy'

set :scm, :git
set :scm_username, 'he9lin'
set :project, 'dieselcrankshaft.com'
set :repository,  "git@github.com:#{scm_username}/#{project}.git"
set :branch, 'master'

set :deploy_to, "/var/www/apps/#{application}"
set :deploy_via, :remote_cache

set :db_type, "mysql"

set :run, user
set :use_sudo, true

role :app, domain
role :web, domain
role :db,  domain, :primary => true

class Capistrano::Configuration
  # Print an informative message with asterisks.
  def inform(message)
    puts "#{'*' * (message.length + 4)}"
    puts "* #{message} *"
    puts "#{'*' * (message.length + 4)}"
  end
 
  # Read a file and evaluate it as an ERB template.
  # Path is relative to this file's directory.
  def render_erb_template(filename)
    template = File.read(filename)
    result   = ERB.new(template).result(binding)
  end
  
  # Run a command and return the result as a string.
  def run_and_return(cmd)
    output = []
    run cmd do |ch, st, data|
      output << data
    end
    return output.to_s
  end
end

# Thin start, stop and restart
namespace :deploy do
  desc "start thin"
  task :start, :roles => :app do
    run "cd #{current_path};thin start -e production -d"
  end
  task :stop, :roles => :app do
    run "cd #{current_path};thin stop -e production"
  end
end

# Copied part from peepcode
namespace :heyook do
  desc "Create shared/config directory and default database.yml. Runs after deploy:setup"
  task :create_shared_config do
    run "mkdir -p #{shared_path}/config"
    result = run_and_return "ls #{shared_path}/config"
    unless result.match(/database\.yml/)
      inform "Please edit database.yml in the shared directory."
    end
  end
  after "deploy:setup", "heyook:create_shared_config"
 
  desc "Symlink shared configs and folders on each release. Runs after deploy:update_code"
  task :symlink_shared_config do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:update_code", "heyook:symlink_shared_config" 
end

namespace :gems do
  desc "Show installed gems"
  task :default do
    run "gem list"
  end
  
  desc "Show gems, cleanly"
  task :stream do
    stream 'gem list'
  end
end

namespace :log do
  desc "Returns last lines of log file. Usage: cap log [-s lines=100] [-s rails_env=production]"  
  task :default do
    lines     = variables[:lines] || 100
    rails_env = variables[:rails_env] || 'production'  
    run "tail -n #{lines} #{shared_path}/log/#{rails_env}.log" do |ch, stream, out|  
      puts out  
    end
  end

  desc "Tails production log file"  
  task :tail, :roles => :app do
    stream "tail -f #{shared_path}/log/production.log"
  end
end

# http://www.mail-archive.com/capistrano@googlegroups.com/msg07356.html
default_run_options[:pty] = true