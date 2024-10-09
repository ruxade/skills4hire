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

file1 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400555/Spanish_bi76xz.jpg").open
skill1 = Skill.new(
  title: "Spanish Language",
  description: "Learn conversational Spanish with a native speaker.",
  price: 30,
  user: user2
)

skill1.photo.attach(io: file1, filename: "spanish.jpg", content_type: "image/png")
skill1.save

file2 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400557/Guitar_u0sgbd.jpg").open
skill2 = Skill.new(
  title: "Guitar Lessons",
  description: "Beginner to intermediate guitar lessons.",
  price: 40,
  user: user1
)

skill2.photo.attach(io: file2, filename: "guitar.jpg", content_type: "image/png")
skill2.save

file3 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400561/Archery_dgcfik.jpg").open
skill3 = Skill.new(
  title: "Archery Training",
  description: "Master the art of archery with our training course.",
  price: 50,
  user: user4
)
skill3.photo.attach(io: file3, filename: "spanish.jpg", content_type: "image/png")
skill3.save

file4 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400556/French_xpulmr.jpg").open
skill4 = Skill.new(
  title: "French Language",
  description: "Learn French with an experienced tutor.",
  price: 35,
  user: user3
)
skill4.photo.attach(io: file4, filename: "spanish.jpg", content_type: "image/png")
skill4.save

file5 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400562/Tennis_Coaching_jqtcms.jpg").open
skill5 = Skill.new(
  title: "Tennis Coaching",
  description: "Improve your tennis skills with a professional coach.",
  price: 45,
  user: user4
)
skill5.photo.attach(io: file5, filename: "spanish.jpg", content_type: "image/png")
skill5.save

file6 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400561/Python_Programming_vdphoq.jpg").open
skill6 = Skill.new(
  title: "Python Programming",
  description: "Get started with Python programming from scratch.",
  price: 60,
  user: user2
)
skill6.photo.attach(io: file6, filename: "spanish.jpg", content_type: "image/png")
skill6.save

file7 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400562/Yoga_Classes_gncotk.jpg").open
skill7 = Skill.new(
  title: "Yoga Classes",
  description: "Join our beginner-friendly yoga sessions to improve flexibility and reduce stress.",
  price: 55,
  user: user3
)
skill7.photo.attach(io: file7, filename: "spanish.jpg", content_type: "image/png")
skill7.save

file8 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400562/writing_bemrnf.jpg").open
skill8 = Skill.new(
  title: "Creative Writing",
  description: "Enhance your writing skills with a creative writer.",
  price: 40,
  user: user1
)
skill8.photo.attach(io: file8, filename: "spanish.jpg", content_type: "image/png")
skill8.save

puts "Skills created"

# BOOKINGS
booking1 = Booking.create!(user: user1, skill: Skill.find_by(title: "Python Programming"), status: "confirmed", message: "booking 1", date: "2024-01-01")
booking2 = Booking.create!(user: user3, skill: Skill.find_by(title: "Tennis Coaching"), status: "pending", message: "booking 2", date: "2024-01-02")

puts "Bookings created"
