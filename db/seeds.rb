puts "DESTROYING USERS"

User.destroy_all
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/c1/Lionel_Messi_20180626.jpg")
walker = User.new(email: "walker@gmail.com", password: "123456", walker_status: true, first_name: "Lionel", last_name: "Messi")
walker.photo.attach(io: file, filename: "messi.jpg", content_type: "image/png")
walker.save
file1 = URI.open("https://www.lavoz.com.ar/resizer/38Hn9e3gImHnJ7HmtXBA6dSuZ-Q=/1023x682/smart/cloudfront-us-east-1.images.arcpublishing.com/grupoclarin/2ZKYOVWOSNHUVIS7SE342CJB54.jpeg")
user = User.new(email: "user@gmail.com", password: "123456", walker_status: false, first_name: "Luquitas", last_name: "Frontend")
user.photo.attach(io: file1, filename: "albert.jpg", content_type: "image/png")
user.save
file2 = URI.open("https://static.nationalgeographicla.com/files/styles/image_3200/public/20-01213_091420-bill-gates-goalkeepers-2020-science_alt.jpg?w=1600&h=900")
user2 = User.new(email: "user2@gmail.com", password: "123456", walker_status: false, first_name: "Juan", last_name: "Perro")
user2.photo.attach(io: file2, filename: "bill.jpg", content_type: "image/png")
user2.save

puts "CREATED walker@gmail.com, user@gmail.com, juan@gmail.com USERS"

puts "DESTROYING DOGS"

Dog.destroy_all
dog_picture1 = URI.open("https://cdn.britannica.com/49/161649-050-3F458ECF/Bernese-mountain-dog-grass.jpg?q=60")
dog1 = Dog.new(name: "Popo", breed: "Labrador", birthday: "01-02-2022", weight: 32, size: "Big DOGGO", user_id: 2)
dog1.photo.attach(io: dog_picture1, filename: "labrador.jpg", content_type: "image/png")
dog1.save
dog_picture2 = URI.open("https://www.purina-latam.com/sites/g/files/auxxlc391/files/styles/social_share_large/public/purina-que-sabes-de-los-perros-poodle_0.jpg?itok=BA9kq-Fz")
dog2 = Dog.new(name: "Cuca", breed: "Poodle", birthday: "10-10-2022", weight: 100, size: "Small doggie", user_id: 2)
dog2.photo.attach(io: dog_picture2, filename: "poodle.jpg", content_type: "image/png")
dog2.save
dog_picture3 = URI.open("https://mascotafiel.com/wp-content/uploads/2014/04/fotos-perros-dalmata.jpg")
dog3 = Dog.new(name: "Coco", breed: "Audi A6 Turbo", birthday: "15-12-2022", weight: 200, size: "Big DOGGO", user_id: 3)
dog3.photo.attach(io: dog_picture3, filename: "nes.png", content_type: "image/png")
dog3.save

puts "CREATED Pikachu, Cuca, Coco DOGS"

puts "DESTROYING ROUTES"

Route.destroy_all
route_picture1 = URI.open("https://www.buenosaires.gob.ar/sites/gcaba/files/centenario_mayep_94.jpg")
route1 = Route.new(name: "Paseo con el parque Centenario", address: "Centenario, Caballito, Caballito - Buenos Aires, C1405, Argentina", user_id: 1)
route1.photo.attach(io: route_picture1, filename: "route1.png", content_type: "image/png")
route1.save
route_picture2 = URI.open("https://upload.wikimedia.org/wikipedia/commons/a/ac/Bosques_de_ezeiza_rio_matanza.jpg")
route2 = Route.new(name: "Paseo con el bosque de Ezeiza", address: "Ezeiza, Buenos Aires, Argentina", user_id: 1)
route2.photo.attach(io: route_picture2, filename: "route2.png", content_type: "image/png")
route2.save

puts "CREATED 3 routes"

puts "DESTROYING RECORDS"

Record.destroy_all
Record.create!(route_id: 1, start_time: "2022-09-02 18:45:00 UTC", end_time: "2022-09-02 21:45:00 UTC", available: 6)
Record.create!(route_id: 1, start_time: "2022-09-02 21:45:00 UTC", end_time: "2022-09-02 23:45:00 UTC", available: 6)
Record.create!(route_id: 2, start_time: "2022-09-02 18:45:00 UTC", end_time: "2022-09-02 21:45:00 UTC", available: 4)

puts "CREATED 2 records"

puts "DESTROYING RESERVATION"

Reservation.destroy_all

puts "CREATED 2 records"
