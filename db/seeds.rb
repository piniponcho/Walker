# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "DESTROYING USERS"

User.destroy_all
User.create!(email: "walker@gmail.com", password: "123456", walker_status: true, first_name: "Lionel", last_name: "Messi")
User.create!(email: "user@gmail.com", password: "123456", walker_status: false, first_name: "Luquitas", last_name: "Frontend")
User.create!(email: "juan@gmail.com", password: "123456", walker_status: false, first_name: "Juan", last_name: "Perro")

puts "CREATED walker@gmail.com, user@gmail.com, juan@gmail.com USERS"

Dog.create!(name: "Pikachu", breed: "Pokemon", age: 23, weight: 32, size:, user_id:)
