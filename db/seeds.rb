# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

if User.count == 0
  User.create!(:email => 'cranker518@gmail.com', :password => 'cranker518', :password_confirmation => 'cranker518')
end
