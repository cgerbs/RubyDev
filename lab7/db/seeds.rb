# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# this is the list of people that I want to add
person_list = [
  ['jt', 25],
  ['jack', 22],
  ['katie', 23],
  ['lindsey', 24],
  ['linds', 33]
]

person_list.each { |name, age| Person.create(name: name, age: age) }
