source 'http://rubygems.org'

gem 'rails', '3.0.7'

gem 'devise', '~> 1.3.3'
gem 'inherited_resources', '~> 1.2.2'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'sass', '3.1.1'
gem 'jquery-rails', '~> 0.2.6'
gem 'decent_exposure'
gem 'thin'
gem 'compass', '>= 0.11.1'
gem 'paperclip', '~> 2.3.10'
gem "nested_form"
gem 'decent_exposure'
gem 'rake', '0.8.7'
gem 'httparty'

group :development, :test do
  gem 'rspec-rails', '~> 2.6.0.rc6'
  gem 'cucumber-rails', :git => 'git://github.com/fd/cucumber-rails.git' # fix Capybara::Driver::RackTest::Node error
  gem 'watchr'
  gem "mail"
  gem 'sqlite3'
end

group :production do
  gem 'mysql2'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara', '~> 1.0.0.beta1'
  gem 'database_cleaner', '0.6.7'
  gem 'launchy', '0.3.7'
end