# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Review.destroy_all
Booking.destroy_all
Skill.destroy_all
User.destroy_all

puts "All records deleted"

# USERS
user1 = User.create!(email: "bruna@example.com", password: "password", name: "Bruna", about: "Brazillian.")
user2 = User.create!(email: "carlos@example.com", password: "password", name: "Carlos", about: "Spanish")
user3 = User.create!(email: "karen@example.com", password: "password", name: "Karen", about: "Brazillian")
user4 = User.create!(email: "adelina@example.com", password: "password", name: "Adelina", about: "Romanian")

puts "Users created"

# SKILLS

file1 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400555/Spanish_bi76xz.jpg").open
skill1 = Skill.new(
  title: "Spanish Language",
  description: "Learn conversational Spanish with a native speaker.",
  description_long: "Spanish is one of the most widely spoken languages in the world, making it a valuable asset in a globalised society. Here are 10 reasons to consider taking it up:
Impress your friends with your accent: Show off your linguistic skills and impress your friends with your accent.
Order food without mistakes: Avoid embarrassing food mishaps and ensure you get exactly what you want.
Sing along to your favourite Latin music: Belt out the lyrics to your favourite Spanish songs with confidence.
Watch Spanish-language films without subtitles: Enjoy movies without the distraction of subtitles.
Become a secret agent: Use your Spanish skills to spy on unsuspecting targets.
Befriend your local taco vendor: Strike up conversations and get the best deals on tacos.
Learn to swear fluently: Impress your friends (or annoy them) with your colourful vocabulary.
Avoid awkward situations when travelling: Navigate foreign countries with ease and avoid misunderstandings.
Become a Spanish-speaking comedian: Tell hilarious jokes and make people laugh in a new language.
Just because it's fun! Learning a new language can be a rewarding and enjoyable experience.",
  price: 30,
  user: user2
)

skill1.photo.attach(io: file1, filename: "spanish.jpg", content_type: "image/jpg")
skill1.save

file2 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400557/Guitar_u0sgbd.jpg").open
skill2 = Skill.new(
  title: "Guitar Lessons",
  description: "Beginner to intermediate guitar lessons.",
  description_long: "Learning to play the guitar can be a rewarding and fulfilling experience.
Become a human jukebox: Play any song requested, no matter how obscure.
Start a \"Guitar Hero\" cover band: Relive your childhood dreams of rock stardom.
Impress your pets with your musical talents: See if your cat or dog can appreciate a good tune.
Become a \"Guitar Hero\" expert: Achieve legendary status in the video game world.
Learn to play \"Stairway to Heaven\" (or any other challenging song): Prove your dedication and skill.
Start a \"Guitar Hero\" tournament: Challenge your friends to a battle of the bands.
Become a \"Guitar Hero\" instructor: Teach others the secrets of the game.
Start a \"Guitar Hero\" merchandise store: Sell \"Guitar Hero\" memorabilia and accessories.
Become a \"Guitar Hero\" celebrity: Achieve internet fame and recognition.
Just because it's fun! Learning to play guitar can be a rewarding and enjoyable experience, no matter the reason.
",
  price: 40,
  user: user1
)

skill2.photo.attach(io: file2, filename: "guitar.jpg", content_type: "image/png")
skill2.save

file3 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400561/Archery_dgcfik.jpg").open
skill3 = Skill.new(
  title: "Archery Training",
  description: "Master the art of archery with our training course.",
  description_long: "Archery is a fascinating and rewarding sport that offers a variety of benefits.
Physical and Mental Health
Improve physical fitness: Archery is a low-impact sport that can help improve strength, flexibility, and balance.
Enhance focus and concentration: Archery requires a high level of concentration and mental focus, which can help improve cognitive abilities.
Reduce stress and anxiety: The rhythmic nature of archery can be a great way to reduce stress and improve overall well-being.
",
  price: 50,
  user: user4
)
skill3.photo.attach(io: file3, filename: "spanish.jpg", content_type: "image/png")
skill3.save

file4 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400556/French_xpulmr.jpg").open
skill4 = Skill.new(
  title: "French Language",
  description: "Learn French with an experienced tutor.",
  description_long: "",
  price: 35,
  user: user3
)
skill4.photo.attach(io: file4, filename: "spanish.jpg", content_type: "image/png")
skill4.save

file5 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400562/Tennis_Coaching_jqtcms.jpg").open
skill5 = Skill.new(
  title: "Tennis Coaching",
  description: "Improve your tennis skills with a professional coach.",
  description_long: "",
  price: 45,
  user: user4
)
skill5.photo.attach(io: file5, filename: "spanish.jpg", content_type: "image/png")
skill5.save

file6 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400561/Python_Programming_vdphoq.jpg").open
skill6 = Skill.new(
  title: "Python Programming",
  description: "Get started with Python programming from scratch.",
  description_long: "",
  price: 60,
  user: user2
)
skill6.photo.attach(io: file6, filename: "spanish.jpg", content_type: "image/png")
skill6.save

file7 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400562/Yoga_Classes_gncotk.jpg").open
skill7 = Skill.new(
  title: "Yoga Classes",
  description: "Join our beginner-friendly yoga sessions to improve flexibility and reduce stress.",
  description_long: "",
  price: 55,
  user: user3
)
skill7.photo.attach(io: file7, filename: "spanish.jpg", content_type: "image/png")
skill7.save

file8 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400562/writing_bemrnf.jpg").open
skill8 = Skill.new(
  title: "Creative Writing",
  description: "Enhance your writing skills with a creative writer.",
  description_long: "",
  price: 40,
  user: user1
)
skill8.photo.attach(io: file8, filename: "spanish.jpg", content_type: "image/png")
skill8.save

puts "Skills created"

# BOOKINGS
booking1 = Booking.create!(user: user1, skill: Skill.find_by(title: "Python Programming"), status: "accepted", message: "booking 1", date: "2024-01-01")
booking2 = Booking.create!(user: user3, skill: Skill.find_by(title: "Tennis Coaching"), status: "pending", message: "booking 2", date: "2024-01-02")

puts "Bookings created"
