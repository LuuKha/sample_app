User.create!(name:  "bacukha",
             email: "bacukha@gmail.com",
             birth_day: Time.now,
             sex: 0,
             phone_number: 12345678910,
             password:              "123456",
             password_confirmation: "123456",admin: true)

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
               password_confirmation: password)
end