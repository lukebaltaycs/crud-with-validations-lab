require 'faker'

20.times do
    Song.create(title: Faker::Music::RockBand.name, released: true, release_year: (1980..2022).to_a.sample, artist_name: Faker::Music::RockBand.name, genre: "Rock n' Roll")
end
puts Song.find(1)