# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.delete_all
Experience.delete_all
UserCategory.delete_all
Category.delete_all
User.delete_all
hobby =["Yoga", "Pet", "Dance", "Video game", "Air sport", "Flying", "Swimming", "Book collevting"]
20.times do
  User.create(
  # photo: "https://source.unsplash.com/random/100x100",
  name: Faker::Name.name ,
  email: Faker::Internet.email,
  phone: "12355667",
  password: "123456",
  bio: Faker::Lorem.word,
  hobbies: hobby.sample
   )
end
category = ["coffeshop", "restuarant", "tourism land mark", "workout places"]
20.times do
Category.create(
  name:category.sample,
)
end
weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
incentive = ["Make friend", "Know neighbourhood","Have free coffe", "For 1000$", "For free"]
title = ["I konw cool place around", "I know cool coffeshop",""]
category =["coffeshop", "restuarant", "tourism land mark", "workout"]
place = ["Meguro", "Harajuku", "shibuya", "shinjuku","Hikarigaoka" ]
description = ["Blue Bottle Coffee is on the ground floor and is accessible from the outside of the building.  I got lost trying to find it, but if you go outside and look up the address on Google maps, make your way toward the pin from the outdoors, you should find it.
I was delighted to see that there’s a Blue Bottle location in Shinjuku.  You can expect the same quality here as you would at any other location.  The staff is friendly and quick.  The craftsmanship is excellent, just what you’d expect from Blue Bottle.  I got a New Orleans drink here, and it tasted just like the one from their New York City shops.  The lines can get long, and there is not much seating available, but there are some benches outside.  The shop indoors across from Blue Bottle has fun culinary accouterments to look at if you’d like to take a small stroll inside.
Enjoy!", "howa Memorial Park is a 165 hectare National Government Park about a 40 minute train ride from Shinjuku Station. The park is great to visit year round with seasonal flowers adding some colour even through the winter months. Noteworthy is the crisscrossed network of cycling paths and bikes including tandem’s are available for hire. In addition the park includes several playgrounds including a Children’s Forest and rainbow pool, BBQ facilities and for couples looking for something quieter there is always pedal boating on the artificial lake.
 Access: From Shinjuku take a Chuo Line train bound for Ome and get off at Nishi Tachikawa Station which closest to the park. Entry fee adults 410 yen / children 80 yen."]
20.times do
  Experience.create(
    title: title.sample,
    description: description.sample,
    incentive: incentive.sample,
    location: place.sample,
    availability: weekdays.sample,
    user_id: User.order("RANDOM()").first.id,
    category_id: Category.order("RANDOM()").first.id
    )
end
20.times do
Booking.create(
  date: weekdays.sample,
  user_id: User.order("RANDOM()").first.id,
  experience_id: Experience.order("RANDOM()").first.id
  )
end
20.times do
UserCategory.create(
  user_id: User.order("RANDOM()").first.id,
 category_id: Category.order("RANDOM()").first.id
  )
end
