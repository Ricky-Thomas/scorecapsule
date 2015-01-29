30.times {
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "password", pic_url: Faker::Avatar.image)
}

10.times {
  Group.create(name: Faker::Lorem.word)
}

20.times {
  user = User.find(rand(1..30))
  group = Group.find(rand(1..10))
  UserGroup.create(user: user, group: group)
  group.games << Game.create(name: Faker::Lorem.word)
}

User.create(name: "Ricky", email: "rickythomas.rt@gmail.com", password: "password")
