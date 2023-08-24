# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create([{username: "Mark"},{username: "Abbey"},{username: "Paulo"},{username: "Mike"},{username: "Davis"} ])

artworks = Artwork.create([{title:"Flower", image_url:" flower.com",artist_id: 1},{title:"Cat", image_url:" cat.com", artist_id: 2},{title:"plane", image_url:" plane.com", artist_id: 2},{title:"Mike", image_url:" Mike.com", artist_id: 4},{title:"car", image_url:" car.com", artist_id: 5}])