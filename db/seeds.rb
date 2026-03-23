# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Flight.destroy_all
Airport.destroy_all

codes = %w[SFO NYC LAX ORD ATL DFW DEN SEA MIA BOS]
airports = codes.map { |c| Airport.create!(code: c) }

9.times do
  Flight.create!(
    departure_airport: airports.sample,
    arrival_airport: airports.sample,
    departure_time: DateTime.now + rand(1..30).days + rand(0..23).hours + rand(0..59).minutes,
    duration: rand(60..600)
  )
end

puts "Created #{Flight.count} flights"
