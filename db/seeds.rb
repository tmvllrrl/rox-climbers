# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(
    email: "homeuser@gmail.com",
    password: "password",
    username: "home_page"
)

user2 = User.create!(
    email: "muminul@gmail.com",
    password: "password",
    username: "muminul"
)

seed1 = Photo.create!(
    route_title: "Hanging",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V3",
    route_location: "Middle Front",
    route_style: "Cylinder Slopers",
    creator: user1
)
seed1.route_image.attach(io: File.open('public/seed1.jpg'), filename: 'seed1.jpg', content_type: 'image/jpg')

seed2 = Photo.create!(
    route_title: "Hanging 2: Electric Boogaloo",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V3",
    route_location: "Middle Front",
    route_style: "Cylinder Slopers",
    creator: user1
)
seed2.route_image.attach(io: File.open('public/seed2.jpg'), filename: 'seed2.jpg', content_type: 'image/jpg')

seed3 = Photo.create!(
    route_title: "Slap that Rock",
    route_description: "Not too bad, but as hard start",
    route_grade: "V1",
    route_location: "Sponge Boulder",
    route_style: "Slopers/Jugs",
    creator: user1
)
seed3.route_image.attach(io: File.open('public/seed3.jpg'), filename: 'seed3.jpg', content_type: 'image/jpg')

seed4 = Photo.create!(
    route_title: "Arete the Way",
    route_description: "Pretty fun, but pretty hard!",
    route_grade: "V2",
    route_location: "Back Wall",
    route_style: "Arete/Crimpy",
    creator: user1
)
seed4.route_image.attach(io: File.open('public/seed4.jpg'), filename: 'seed4.jpg', content_type: 'image/jpg')
