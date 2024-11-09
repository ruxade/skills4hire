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

# REVIEWS
review1 = Review.create!(
  booking: booking1,
  comment: "Amazing Python class! The explanations were clear, and the exercises were practical.",
  rating: 5
)

review2 = Review.create!(
  booking: booking1,
  comment: "Great follow-up session. Learned a lot about automating tasks with Python.",
  rating: 4
)

review3 = Review.create!(
  booking: booking2,
  comment: "The tennis coaching was very helpful and improved my skills significantly.",
  rating: 4
)

review4 = Review.create!(
  booking: booking2,
  comment: "Fun and challenging! The instructor provided great tips for perfecting my serve.",
  rating: 5
)

# Additional bookings and reviews for other skills
booking3 = Booking.create!(user: user2, skill: Skill.find_by(title: "Guitar Lessons"), status: "completed", message: "Guitar practice session", date: "2024-02-10")
review5 = Review.create!(
  booking: booking3,
  comment: "The guitar lesson was fantastic! Bruna's teaching style is very engaging.",
  rating: 5
)

review6 = Review.create!(
  booking: booking3,
  comment: "I learned so much in one session. Can't wait for the next one!",
  rating: 4
)

booking4 = Booking.create!(user: user4, skill: Skill.find_by(title: "Archery Training"), status: "completed", message: "Archery basics and techniques", date: "2024-03-05")
review7 = Review.create!(
  booking: booking4,
  comment: "Archery training was superb! Adelina's focus on technique was very effective.",
  rating: 5
)

review8 = Review.create!(
  booking: booking4,
  comment: "Great lesson with lots of practical tips. Highly recommended.",
  rating: 4
)

puts "Reviews created"


# USERS
user1 = User.create!(email: "bruna@example.com", password: "password", name: "Bruna", about: "Passionate about music and writing, Bruna is a skilled guitarist and creative writing instructor.
Whether you're a beginner looking to learn your first chords or an aspiring author eager to develop compelling characters, Bruna's patient and engaging teaching style will help you reach your full potential.
She believes in fostering a supportive and fun learning environment where students can explore their creativity and build confidence.")
user2 = User.create!(email: "carlos@example.com", password: "password", name: "Carlos", about: "Carlos is fluent in Spanish, Python, and the language of laughter.
He believes learning should be an adventure, not a chore. So if you're ready to spice up your life with new skills and a healthy dose of humour, join Carlos on a learning journey you won't soon forget.")
user3 = User.create!(email: "karen@example.com", password: "password", name: "Karen", about: "Karen believes in the transformative power of travel, language, and mindful movement.
As an experienced yoga instructor and French tutor, she encourages students to step outside their comfort zones, embrace new challenges, and cultivate a global mindset.
Her classes are designed to be both enriching and enjoyable, fostering a sense of community and shared learning.")
user4 = User.create!(email: "adelina@example.com", password: "password", name: "Adelina", about: "More than just teaching technique, Adelina helps her students develop a deep understanding of archery and tennis strategy.
She believes that mental focus and strategic thinking are just as important as physical skill. With her guidance, you'll learn to analyse your performance, anticipate your opponent's moves, and make smart decisions under pressure.")

puts "Users created"

# SKILLS

file1 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400555/Spanish_bi76xz.jpg").open
skill1 = Skill.new(
  title: "Spanish Language",
  description: "Learn conversational Spanish with a native speaker.",
  description_long: "Spanish is one of the most widely spoken languages in the world, making it a valuable asset in a globalised society.
Here are 10 reasons to consider taking it up:
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
Just because it's fun! Learning to play guitar can be a rewarding and enjoyable experience, no matter the reason.",
  price: 40,
  user: user1
)

skill2.photo.attach(io: file2, filename: "guitar.jpg", content_type: "image/png")
skill2.save

file3 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400561/Archery_dgcfik.jpg").open
skill3 = Skill.new(
  title: "Archery Training",
  description: "Master the art of archery with our training course.",
  description_long: "Ever dreamt of hitting the bullseye like Robin Hood (but with less outlaw activity)?
  Archery lessons are your chance to channel your inner archer!
  It's surprisingly zen (who knew holding a bow steady could be so calming?),
  and you'll get a sneaky arm workout while you're at it. Plus, bragging rights when you hit that target dead center.",
  price: 50,
  user: user4
)
skill3.photo.attach(io: file3, filename: "spanish.jpg", content_type: "image/png")
skill3.save

file4 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400556/French_xpulmr.jpg").open
skill4 = Skill.new(
  title: "French Language",
  description: "Learn French with an experienced tutor.",
  description_long: "Tired of subtitles ruining your French film experience?  Say \"au revoir\" to those distracting white boxes and \"bonjour\" to the nuances of French cinema!
  With French lessons, you'll unlock a world of captivating stories, witty dialogue, and maybe even some existential pondering (it's a French thing).
  Who needs popcorn when you have subtitles you can understand?",
  price: 35,
  user: user3
)
skill4.photo.attach(io: file4, filename: "spanish.jpg", content_type: "image/png")
skill4.save

file5 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400562/Tennis_Coaching_jqtcms.jpg").open
skill5 = Skill.new(
  title: "Tennis Coaching",
  description: "Improve your tennis skills with a professional coach.",
  description_long: "Tennis: it's not just for Wimbledon champions and people with pristine white outfits.
  Tennis coaching is for everyone, even those of us who currently consider \"hitting the ball over the net\" a major victory.
  You'll learn the basics, have a good laugh (mostly at yourself, let's be honest), and get some exercise while you're at it.
  Who knows, you might even discover a hidden talent for the sport!",
  price: 45,
  user: user4
)
skill5.photo.attach(io: file5, filename: "spanish.jpg", content_type: "image/png")
skill5.save

file6 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400561/Python_Programming_vdphoq.jpg").open
skill6 = Skill.new(
  title: "Python Programming",
  description: "Get started with Python programming from scratch.",
  description_long: "Warning: May cause extreme levels of employability. Learn Python and become the most sought-after person in the room.
  Why? Because Python is the Swiss Army knife of coding languages—it can do everything from building websites to analysing data to automating your life.
  (Side effects may include: increased salary, sudden urge to automate everything, and uncontrollable laughter at your own jokes.) Sign up now.",
  price: 60,
  user: user2
)
skill6.photo.attach(io: file6, filename: "spanish.jpg", content_type: "image/png")
skill6.save

file7 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400562/Yoga_Classes_gncotk.jpg").open
skill7 = Skill.new(
  title: "Yoga Classes",
  description: "Join our beginner-friendly yoga sessions to improve flexibility and reduce stress.",
  description_long:"Feeling overwhelmed by life's chaos?  Yoga classes are your escape hatch!
  You'll learn to breathe deeply, quiet your mind, and find your inner zen (or at least a moment of peace in a crazy world).
  Plus, it's a fantastic way to improve your posture and reduce those pesky aches and pains.  Who needs a massage when you have yoga?",
  price: 55,
  user: user3
)
skill7.photo.attach(io: file7, filename: "spanish.jpg", content_type: "image/png")
skill7.save

file8 = URI.parse("https://res.cloudinary.com/do1nrl43q/image/upload/v1728400562/writing_bemrnf.jpg").open
skill8 = Skill.new(
  title: "Creative Writing",
  description: "Enhance your writing skills with a creative writer.",
  description_long:"Give life to the voices in your head (in a good way). Our Creative Writing workshop focuses on the heart of every great story: the characters.
  Learn to develop personalities that sizzle, motivations that intrigue, and backstories that will make your readers say, \"Tell me more!\"
  We'll delve into the psychology of character creation, explore techniques for crafting compelling dialogue, and help you build a cast of characters that will steal the show (and maybe even your heart).
  Enrol now and let the character creation commence.",
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
