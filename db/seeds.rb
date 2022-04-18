# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeds for Home Page User and Photos

user1 = User.create!(
    email: "rox_climbers@gmail.com",
    password: "password",
    username: "home_page"
)

seed1 = Photo.create!(
    route_title: "Hanging",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V4",
    route_location: "Middle Front",
    route_style: "Slopers",
    creator: user1
)
seed1.route_image.attach(io: File.open('public/seed1.jpg'), filename: 'seed1.jpg', content_type: 'image/jpg')

seed2 = Photo.create!(
    route_title: "Hanging 2: Electric Boogaloo",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V3",
    route_location: "Middle Front",
    route_style: "Slopers",
    creator: user1
)
seed2.route_image.attach(io: File.open('public/seed2.jpg'), filename: 'seed2.jpg', content_type: 'image/jpg')

seed3 = Photo.create!(
    route_title: "Slap that Rock",
    route_description: "Not too bad, but as hard start",
    route_grade: "V1",
    route_location: "Sponge Boulder",
    route_style: "Jugs",
    creator: user1
)
seed3.route_image.attach(io: File.open('public/seed3.jpg'), filename: 'seed3.jpg', content_type: 'image/jpg')

seed4 = Photo.create!(
    route_title: "Arete the Way",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V2",
    route_location: "Back Wall",
    route_style: "Crimps",
    creator: user1
)
seed4.route_image.attach(io: File.open('public/seed4.jpg'), filename: 'seed4.jpg', content_type: 'image/jpg')

# Seeds for Muminul User and Photos

user2 = User.create!(
    email: "muminul@gmail.com",
    password: "password",
    username: "muminul"
)

seed5 = Photo.create!(
    route_title: "Hanging",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V2",
    route_location: "Middle Front",
    route_style: "Slopers",
    creator: user2
)
seed5.route_image.attach(io: File.open('public/seed1.jpg'), filename: 'seed1.jpg', content_type: 'image/jpg')

seed6 = Photo.create!(
    route_title: "Hanging 2: Electric Boogaloo",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V3",
    route_location: "Middle Front",
    route_style: "Slopers",
    creator: user2
)
seed6.route_image.attach(io: File.open('public/seed2.jpg'), filename: 'seed2.jpg', content_type: 'image/jpg')

# Seeds for Michael User and Photos

user3 = User.create!(
    email: "michael@gmail.com",
    password: "password",
    username: "michael"
)

seed7 = Photo.create!(
    route_title: "Slap that Rock",
    route_description: "Not too bad, but as hard start",
    route_grade: "V1",
    route_location: "Sponge Boulder",
    route_style: "Jugs",
    creator: user3
)
seed7.route_image.attach(io: File.open('public/seed3.jpg'), filename: 'seed3.jpg', content_type: 'image/jpg')

seed8 = Photo.create!(
    route_title: "Arete the Way",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V2",
    route_location: "Back Wall",
    route_style: "Crimps",
    creator: user3
)
seed8.route_image.attach(io: File.open('public/seed4.jpg'), filename: 'seed4.jpg', content_type: 'image/jpg')

seed9 = Photo.create!(
    route_title: "Hanging",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V2",
    route_location: "Middle Front",
    route_style: "Slopers",
    creator: user3
)
seed9.route_image.attach(io: File.open('public/seed1.jpg'), filename: 'seed1.jpg', content_type: 'image/jpg')

# Seeds for Yuexin User and Photos

user4 = User.create!(
    email: "yuexin@gmail.com",
    password: "password",
    username: "yuexin"
)

seed10 = Photo.create!(
    route_title: "Hanging",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V3",
    route_location: "Middle Front",
    route_style: "Slopers",
    creator: user4
)
seed10.route_image.attach(io: File.open('public/seed1.jpg'), filename: 'seed1.jpg', content_type: 'image/jpg')

seed11 = Photo.create!(
    route_title: "Slap that Rock",
    route_description: "Not too bad, but as hard start",
    route_grade: "V1",
    route_location: "Sponge Boulder",
    route_style: "Jugs",
    creator: user4
)
seed11.route_image.attach(io: File.open('public/seed3.jpg'), filename: 'seed3.jpg', content_type: 'image/jpg')

seed12 = Photo.create!(
    route_title: "Arete the Way",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V2",
    route_location: "Back Wall",
    route_style: "Crimps",
    creator: user4
)
seed12.route_image.attach(io: File.open('public/seed4.jpg'), filename: 'seed4.jpg', content_type: 'image/jpg')

# Seeds for Mahitha User and Photos

user4 = User.create!(
    email: "mahitha@gmail.com",
    password: "password",
    username: "mathitha"
)

seed13 = Photo.create!(
    route_title: "Hanging 2: Electric Boogaloo",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V3",
    route_location: "Middle Front",
    route_style: "Slopers",
    creator: user4
)
seed13.route_image.attach(io: File.open('public/seed2.jpg'), filename: 'seed2.jpg', content_type: 'image/jpg')

seed14 = Photo.create!(
    route_title: "Slap that Rock",
    route_description: "Not too bad, but as hard start",
    route_grade: "V1",
    route_location: "Sponge Boulder",
    route_style: "Jugs",
    creator: user4
)
seed14.route_image.attach(io: File.open('public/seed3.jpg'), filename: 'seed3.jpg', content_type: 'image/jpg')

seed15 = Photo.create!(
    route_title: "Arete the Way",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V2",
    route_location: "Back Wall",
    route_style: "Crimps",
    creator: user4
)
seed15.route_image.attach(io: File.open('public/seed4.jpg'), filename: 'seed4.jpg', content_type: 'image/jpg')
