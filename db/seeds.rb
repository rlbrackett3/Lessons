# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating some users with some posts"
5.times do |n|
  user = User.create fname: "Foo#{n}", email: "foo#{n}@bar.com"
  puts "#{n} Users Created"
  
  puts "Creating some posts for #{user}"
  10.times do |p|
    user.posts.create title: "Post Number #{n} for #{user.fname}", body: "Hello World"
  end
  puts "Posts created"
end