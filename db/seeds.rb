# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Match.delete_all
User.delete_all

tourist = User.create!(
  first_name: "Feli",
  last_name: "Hernandez",
  city: "Buenos Aires",
  birthday: Date.new(1990,2,14),
  gender: "male",
  score: 5,
  verified: true,
  biography: "Something",
  available: true,
  languages: "spanish",
  occupation: "Teacher",
  email: "f@gmail.com",
  password: "123456"
)
local = User.create!(
  first_name: "Nico",
  last_name: "Donoso",
  city: "Buenos Aires",
  birthday: Date.new(1990,10,31),
  gender: "male",
  score: 5,
  verified: true,
  biography: "Something",
  available: true,
  languages: "spanish",
  occupation: "Student",
  email: "n@gmail.com",
  password: "123456"
)
match = Match.new!(
  local_id: local.id,
  tourist_id: tourist.id,
  available: true,
  accepted: true
)
