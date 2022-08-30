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

puts "DESTROYING DOGS"

Dog.destroy_all
Dog.create!(name: "Pikachu", breed: "Pokemon", birthday: "01-02-2022", weight: 32, size: "Small Doggie", user_id: 2)
Dog.create!(name: "Cuca", breed: "Gato", birthday: "10-10-2022", weight: 100, size: "Big DOGGO", user_id: 3)
Dog.create!(name: "Coco", breed: "Audi A6 Turbo", birthday: "15-12-2022", weight: 200, size: "PERROTE", user_id: 2)

puts "CREATED Pikachu, Cuca, Coco DOGS"


puts "DESTROYING ROUTES"

Route.destroy_all
Route.create!(name: "Plaza", address: "Corrientes 2668", user_id: 1)


puts "DESTROYING RECORDS"
Record.destroy_all
Record.create!(route_id: 1, start_time: "01-02-2022", end_time: "01-02-2022")


puts "DESTROYING RESERVATION"
Reservation.destroy_all
Reservation.create!(record_id: 1, dog_id: 1)
