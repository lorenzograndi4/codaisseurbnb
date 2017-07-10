Profile.destroy_all
Ticket.destroy_all
Theme.destroy_all
Photo.destroy_all
Event.destroy_all
User.destroy_all

# Users
lorenzo1 = User.create!(email: "lorenzo+1@pr.co", password: "lorenzo")
lorenzo2 = User.create!(email: "lorenzo.grandi4@gmail.com", password: "lorenzo")

puts "#{User.all.size} users created"

# Events
event1 = Event.create!(
  name: "Monthly Yoga Weekend",
  description: "Let's come together and practice some asanas together in the woods!",
  location: "Amsterdam",
  includes_food: false,
  includes_drinks: true,
  price: 10,
  starts_at: 10.days.from_now,
  ends_at: 12.days.from_now,
  capacity: 100,
  active: true,
  user: lorenzo1
)

puts "#{Event.all.size} events created"

# Themes
Theme.create!([
  { name: "Movements" },
  { name: "Outdoors & Adventure" },
  { name: "Tech" },
  { name: "Family" },
  { name: "Health & Wellness" },
  { name: "Sports & Fitness" },
  { name: "Learning" },
  { name: "Photography" },
  { name: "Food & Drink" },
])

puts "#{Theme.all.size} themes created"

# Photos
# photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/lorenzocloudinary/image/upload/v1499347416/gtt08g1hdkymczecgogr.jpg", event: event1)
# photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/lorenzocloudinary/image/upload/v1499346823/fikzms6qtuulzuaa1nsm.jpg", event: event1)
# photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/lorenzocloudinary/image/upload/v1499346822/vndqg81ggj99jcwa2vxy.jpg", event: event1)

puts "#{Photo.all.size} photos created"

# Events
event1 = Event.find_by(name: "Monthly Yoga Weekend")
event1.themes << Theme.find_by(name: "Outdoors & Adventure")
event1.themes << Theme.find_by(name: "Sports & Fitness")
# event1.photos << photo1
# event1.photos << photo2
# event1.photos << photo3

puts "#{Event.all.size} themed events created"

Ticket.create!(event: event1, user: lorenzo2, starts_at: 10.days.from_now, ends_at: 12.days.from_now)
Ticket.create!(event: event1, user: lorenzo2, starts_at: 20.days.from_now, ends_at: 24.days.from_now)

puts "#{Ticket.all.size} tickets created."
