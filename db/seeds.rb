Theme.delete_all
# Users
lorenzo1 = User.create(email: "lorenzo@pr.co", password: "lorenzo")
lorenzo2 = User.create(email: "lorenzo.grandi4@gmail.com", password: "lorenzo")

puts "#{User.all.size} users created"

# Events
event = Event.create!(
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

puts "#{Theme.all.size} categories created"

# Events
event = Event.find_by(name: "Monthly Yoga Weekend")
event.themes << Theme.find_by(name: "Outdoors & Adventure")
event.themes << Theme.find_by(name: "Sports & Fitness")

puts "#{Event.all.size} events created"
