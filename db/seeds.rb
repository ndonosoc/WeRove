# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"
require 'json'

# Bookmark.delete_all
# Rating.delete_all
# Message.delete_all
# Match.delete_all
# Review.delete_all
# Recommendation.delete_all
# UserInterest.delete_all
# Interest.delete_all
# User.delete_all

# 50.times do
#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     city: ["Buenos Aires", "Paris", "London", "New York"].sample,
#     languages: ["french", "spanish", "english", "japanese"].sample(2),
#     gender: ["male", "female", "non-binary"].sample,
#     birthday: Faker::Date.between(from: 10000.days.ago, to: 8000.days.ago),
#     biography: Faker::Quote.matz,
#     available: true,
#     occupation: Faker::Job.title,
#     score: rand(1..5),
#     password: '123456'
#   )
#     file = URI.open("https://source.unsplash.com/640x480/?people")
#     user.photo.attach(io: file, filename: "#{user.first_name}-#{user.last_name}.jpg", content_type: "image/jpeg")
#     if user.save!
#     puts "saved"
#     else
#       puts "not saved"
#     end
# end

# # INTEREST = %w( Sports Vegan Food Party Gaming )

# # INTEREST.each do |interest|
# #   Interest.create!(
# #     title: interest
# #   )
# # end


# 20.times do
#   users = User.all.sample(2)
#   Match.create!(
#     local_id: users[0].id,
#     tourist_id: users[1].id,
#     accepted: true
#   )
# end

# 30.times do
#   recommendation = Recommendation.new(
#     user_id: User.all.sample.id,
#     category: ["Nightlife", "Restaurant", "Sports event", "Sightseeing"].sample,
#     description: Faker::ChuckNorris.fact,
#     price_range: "From $#{rand(200..300)} to $#{rand(400..600)}",
#     duration: "#{["30", "60", "90", "120"].sample} minutes",
#     reservation: "#{["Not needed", "Should plan with anticipation"].sample}",
#     location: "#{["Recoleta", "Palermo", "Berazategui", "Belgrano"].sample}",
#     title: Faker::Games::Pokemon.location
#   )

#     file = URI.open("https://placeimg.com/640/480/arch")
#     recommendation.photo.attach(io: file, filename: "#{recommendation.title}-#{recommendation.user_id}.jpg", content_type: "image/jpeg")
#     recommendation.save

# end

# 50.times do
#   recommendation = Recommendation.all.sample
#   Review.create(recommendation_id: recommendation.id,
#                 user_id: User.all.sample.id,
#                 content: Faker::Quote.famous_last_words,
#                 rating: rand(1..5))
#   recommendation.update_rating
# end


#INTERESTS


parent = Interest.create(title: "Taste")
Interest.create(title: "Alternative", parent_id: parent.id)
Interest.create(title: "Classic", parent_id: parent.id)
Interest.create(title: "Boho", parent_id: parent.id)
Interest.create(title: "Chic", parent_id: parent.id)
Interest.create(title: "Trendy", parent_id: parent.id)
Interest.create(title: "Intellectual", parent_id: parent.id)
Interest.create(title: "Vintage", parent_id: parent.id)


parent = Interest.create(title: "Going Out")
Interest.create(title: "Bars", parent_id: parent.id)
Interest.create(title: "Clubs", parent_id: parent.id)
Interest.create(title: "Pubs", parent_id: parent.id)
Interest.create(title: "Speakeasies", parent_id: parent.id)
Interest.create(title: "Outdoor party", parent_id: parent.id)
Interest.create(title: "BBQ", parent_id: parent.id)
Interest.create(title: "Cocktails", parent_id: parent.id)


parent = Interest.create(title: "Food")
Interest.create(title: "Meat lover", parent_id: parent.id)
Interest.create(title: "Gluten free", parent_id: parent.id)
Interest.create(title: "Vegetarian", parent_id: parent.id)
Interest.create(title: "Fast-food", parent_id: parent.id)
Interest.create(title: "Haut cuisine", parent_id: parent.id)
Interest.create(title: "Authentic", parent_id: parent.id)
Interest.create(title: "International", parent_id: parent.id)


parent = Interest.create(title: "Sports")
Interest.create(title: "Tennis", parent_id: parent.id)
Interest.create(title: "Cycling", parent_id: parent.id)
Interest.create(title: "Football", parent_id: parent.id)
Interest.create(title: "Surfing", parent_id: parent.id)
Interest.create(title: "Running", parent_id: parent.id)
Interest.create(title: "Hiking", parent_id: parent.id)
Interest.create(title: "Yoga", parent_id: parent.id)

parent = Interest.create(title: "Other activities")
Interest.create(title: "Chess", parent_id: parent.id)
Interest.create(title: "Bowling", parent_id: parent.id)
Interest.create(title: "Birdwatching", parent_id: parent.id)
Interest.create(title: "Scuba diving", parent_id: parent.id)
Interest.create(title: "Sailing", parent_id: parent.id)
Interest.create(title: "Cooking", parent_id: parent.id)
Interest.create(title: "Meditation", parent_id: parent.id)

parent = Interest.create(title: "Other interests")
Interest.create(title: "History", parent_id: parent.id)
Interest.create(title: "Art", parent_id: parent.id)
Interest.create(title: "Beach", parent_id: parent.id)
Interest.create(title: "Theater", parent_id: parent.id)
Interest.create(title: "Markets", parent_id: parent.id)
Interest.create(title: "Religion", parent_id: parent.id)
Interest.create(title: "Nature", parent_id: parent.id)

parent = Interest.create(title: "Music")
Interest.create(title: "Classical", parent_id: parent.id)
Interest.create(title: "Rock", parent_id: parent.id)
Interest.create(title: "Electronic", parent_id: parent.id)
Interest.create(title: "Jazz", parent_id: parent.id)
Interest.create(title: "Punk", parent_id: parent.id)
Interest.create(title: "Country", parent_id: parent.id)
Interest.create(title: "Pop", parent_id: parent.id)

# list = Interest.where.not(parent_id: nil).group_by { |x| x.parent_id }

# User.all.each do |user|
#   list.keys.each do |parent|
#     list[parent].sample(4).each do |interest|
#       UserInterest.create(
#         user_id: user.id,
#         interest_id: interest.id
#         )
#     end
#   end
# end
