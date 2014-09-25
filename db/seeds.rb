# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

i = 1
while i < 5 do
  puts "Creating user number #{i}"
  users = User.create([ name: "Foo Ba#{i}r",
                        email: "foo@bar#{i}.com",
                        password: "foobar",
                        bio: "Hello World, I am number #{i}."])
  i += 1
end

5.times do |p|
  user = User.first
  puts "Creating post number #{p} for user."
  posts = user.posts.create([
                              title: "Hello #{p}",
                              body: "#{p} World!"
                              ])
end