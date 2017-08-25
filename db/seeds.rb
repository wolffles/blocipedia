User.create!(
email: "wolfie.truong@gmail.com",
password: "password"
)
User.create!(
email: "wolfgang.truong@gmail.com",
password: "password"
)

5.times do
  User.create!(
  email: Faker::Hipster.word + "@mail.com",
  password: "password"
  )
end

users = User.all

15.times do
  Wiki.create!(
  title: Faker::Hipster.sentence,
  body: Faker::Hipster.paragraph,
  user: users.sample
  )
end

puts "Seed Finished"
puts "#{User.count} user created"
puts "#{Wiki.count} Wiki posts created"
