# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing records
Booking.destroy_all
Skill.destroy_all
User.destroy_all

# Seed Users
user1 = User.create!(name: 'Alice', email: 'alice@example.com', password: 'password')
user2 = User.create!(name: 'Bob', email: 'bob@example.com', password: 'password')

# Seed Skills
skill1 = Skill.create!(title: 'Guitar Lessons', description: 'Learn guitar from scratch', price: 50.0, user: user1)
skill2 = Skill.create!(title: 'Painting Classes', description: 'Master the art of painting', price: 75.0, user: user2)

# Seed Bookings
Booking.create!(user: user1, skills: [skill2], status: 'pending', created_at: Time.now, updated_at: Time.now)
Booking.create!(user: user2, skills: [skill1], status: 'accepted', created_at: Time.now, updated_at: Time.now)

puts "Seeding completed!"
