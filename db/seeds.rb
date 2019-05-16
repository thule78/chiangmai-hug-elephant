require 'faker'


10.times do
  location = Faker::Address.city
  user = User.new(name: Faker::TvShows::Seinfeld.character, email: Faker::Internet.email, password: '123456')
  tour = Tour.new(name: "#{Faker::Verb.ing_form.capitalize} #{Faker::Hipster.word.capitalize} #{location} Tours", details: Faker::TvShows::Seinfeld.quote, cost: rand(300), location: location, provider_id: 1)
  tour_photo_url = "http://loremflickr.com/280/280/#{location}"
  tour.remote_photo_url = tour_photo_url
  tour.save
  user_photo_url = 'https://loremflickr.com/320/240'
  user.remote_photo_url = user_photo_url
  user.save
end

puts 'seeded!'
