# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Create a admin user"
admin = User.create(name: "FooAdmin", password: "foobar", password_confirmation: "foobar", admin: true)
puts "Admin user created"

puts "Create a normal user"
admin = User.create(name: "FooNormal", password: "foobar", password_confirmation: "foobar", admin: false)
puts "Normal user created"

puts "Generating sample posts"
30.times do |n|
  admin.posts.create(title: "Post Number #{n}", body: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.")
  puts "Post #{n} created"
end
puts "Sample posts created"
