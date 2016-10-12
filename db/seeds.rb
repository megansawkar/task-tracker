# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
require 'rubygems'
require 'faker'
require 'random_data'

5.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

#Create items
50.times do
  Item.create(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
end

items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
