# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Role.create(:name => :admin)
Role.create(:name => :moderator)
Role.create(:name => :user)
u = User.create( :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
u.roles.push Role.find_by_name :admin
u = User.create( :email => 'moderator@example.com', :password => 'password', :password_confirmation => 'password')
u.roles.push Role.find_by_name :moderator
