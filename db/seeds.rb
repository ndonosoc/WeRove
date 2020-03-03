# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Match.delete_all
Recommendation.delete_all
UserInterest.delete_all
Interest.delete_all
User.delete_all

50.times do
  user = User.new(
    first_name: Faker::GreekPhilosophers.name,
    last_name: Faker::Superhero.suffix,
    email: Faker::Internet.email,
    city: ["Buenos Aires", "Paris", "London", "New York", "Tokyo", "Zurich"].sample(1),
    languages: ["french", "spanish", "english", "japanese"].sample(2),
    gender: ["male", "female", "non-binary"].sample,
    birthday: Faker::Date.between(from: 10000.days.ago, to: 8000.days.ago),
    biography: Faker::Hipster.paragraph,
    available: true,
    occupation: Faker::Job.title,
    score: rand(1..5),
    password: '123456'
  )

  user.save!
end

INTEREST = %w( Sports Vegan Food Party Gaming )

INTEREST.each do |interest|
  Interest.create!(
    title: interest
  )
end

User.all.each do |user|
  Interest.all.sample(3).each do |interest|
    UserInterest.create(
      user_id: user.id,
      interest_id: interest.id
    )
  end
end

20.times do
  users = User.all.sample(2)
  Match.create!(
    local_id: users[0].id,
    tourist_id: users[1].id,
    accepted: true
  )
end

30.times do
  Recommendation.create!(
    user_id: User.all.sample.id,
    category: ["Nightlife", "Restaurant", "Sports event", "Sightseeing"].sample,
    description: Faker::ChuckNorris.fact,
    price_range: "From $#{rand(200..300)} to $#{rand(400..600)}",
    duration: "#{["30", "60", "90", "120"].sample} minutes",
    reservation: "#{["Not needed", "Should plan with anticipation"].sample}",
    location: "#{["Recoleta", "Palermo", "Berazategui", "Belgrano"].sample}"
  )
end

# 50.times do
#   Review.create(recommendation_id: rand(1..30),
#                 user_id: rand(1..50),
#                 content: Faker::Quote.famous_last_words,
#                 rating: rand(1..5))
# end

# Match.all.each do |match|
#   5.times do
#     Message.new(messager_id: [match.local_id, match.tourist_id].sample,
#                 match_id: match.id,
#                 content: Faker::Quote.matz)
#   end
# end

# 40.times do
#   Bookmark.create(user_id: rand(1..50),
#                   recommendation_id: rand(1..30))
# end

# Match.all.sample(5).each do |match|
#   Rating.create(match_id: match.id,
#                 rating: rand(1..5),
#                 rated_id: match.local_id,
#                 rater_id: match.tourist_id)

#   Rating.create(match_id: match.id,
#                 rating: rand(1..5),
#                 rated_id: match.tourist_id,
#                 rater_id: match.local_id)
# end

