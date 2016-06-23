User.create!(name:  "bacukha",
 email: "bacukha@gmail.com",
 birth_day: Time.now,
 sex: 0,
 phone_number: 12345678910,
 password:              "123456",
 password_confirmation: "123456",
 admin: true,
 activated: true,
 activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
   email: email,
   birth_day: Time.now,
   sex: 1,
   phone_number: 12345678910,
   password:              password,
   password_confirmation: password,
   activated: true,
   activated_at: Time.zone.now)
end
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content,
    category: 0,
    title: "lung tung"
    ) }
end
# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
