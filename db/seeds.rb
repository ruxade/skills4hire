# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Booking.destroy_all
Skill.destroy_all
User.destroy_all

puts "All records deleted"

# USERS
user1 = User.create!(email: "bruna@example.com", password: "password", name: "Bruna")
user2 = User.create!(email: "carlos@example.com", password: "password", name: "Carlos")
user3 = User.create!(email: "karen@example.com", password: "password", name: "Karen")
user4 = User.create!(email: "adelina@example.com", password: "password", name: "Adelina")

puts "Users created"

# SKILLS

Skill.create!(
  title: "Spanish Language",
  description: "Learn conversational Spanish with a native speaker.",
  price: 30,
  user: user2
)

Skill.create!(
  title: "Guitar Lessons",
  description: "Beginner to intermediate guitar lessons.",
  price: 40,
  user: user1
)

Skill.create!(
  title: "Archery Training",
  description: "Master the art of archery with our training course.",
  price: 50,
  user: user4
)

Skill.create!(
  title: "French Language",
  description: "Learn French with an experienced tutor.",
  price: 35,
  user: user3
)

Skill.create!(
  title: "Tennis Coaching",
  description: "Improve your tennis skills with a professional coach.",
  price: 45,
  user: user4
)

Skill.create!(
  title: "Python Programming",
  description: "Get started with Python programming from scratch.",
  price: 60,
  user: user2
)

Skill.create!(
  title: "Yoga Classes",
  description: "Join our beginner-friendly yoga sessions to improve flexibility and reduce stress.",
  price: 55,
  user: user3
)

Skill.create!(
  title: "Creative Writing",
  description: "Enhance your writing skills with a creative writer.",
  price: 40,
  user: user1
)

puts "Skills created"

# BOOKINGS
booking1 = Booking.create!(user: user1, skill: Skill.find_by(title: "Python Programming"), status: "confirmed")
booking2 = Booking.create!(user: user3, skill: Skill.find_by(title: "Tennis Coaching"), status: "pending")

puts "Bookings created"
