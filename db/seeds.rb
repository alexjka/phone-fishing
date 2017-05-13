# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Spot.create!(
  name: "Penikese",
  description: "just between Penikese and Cuttyhunk",
  user_id: 1,
  lat: "41.4393",
  long: "70.9275"
  )
Spot.create!(
  name: "Weepeckets",
  description: "just east of Robinsons",
  user_id: 1,
  lat: "41.5168",
  long: "70.7356"
  )
