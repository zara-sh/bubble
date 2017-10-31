  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.delete_all
Schedule.delete_all
Experience.delete_all
UserCategory.delete_all
Category.delete_all
User.delete_all

puts "Deleted Stuff"
hobby =["Yoga", "Pet", "Dance", "Video game", "Air sport", "Flying", "Swimming", "Book collevting"]
20.times do
  user = User.new(
  name: Faker::Name.name ,
  email: Faker::Internet.email,
  phone: "12355667",
  password: "123456",
  bio: Faker::Lorem.word,
  hobbies: hobby.sample,
  confirmed_at: Time.now
   )
  user.photo_url = "https://source.unsplash.com/random/100x100"
  user.save!

  # user.photo_url = 'https://picsum.photos/200/300/?random'
end


puts "Users created!"

category1 = Category.create!(
  name: 'Best Coffee',
  icon: 'fa-coffee'
)
category2 = Category.create!(
  name: 'Happy Hour',
  icon: 'fa-glass'
)
category3 = Category.create!(
  name: 'Great Workouts',
  icon: 'fa-bolt'
)
category4 = Category.create!(
  name: 'Relax and Unwind',
  icon: 'fa-tint'
)
category5 = Category.create!(
  name: 'Trendy Tourism',
  icon: 'fa-flag'
)
categories_array = [category1, category2, category3, category4, category5]



weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
incentive = ["Make Friends", "Get To Know The Area","Free Cup of Coffee", "$$$", "For Free!"]
title = ["I konw cool place around", "I know cool coffeshop", "I know cool gym", "I know cool spa"]

place = ["Meguro, Tokyo", "Harajuku, Tokyo", "shibuya, Tokyo", "shinjuku, Tokyo","Hikarigaoka, Tokyo", "Ginza, Tokyo", "Koenji, Tokyo" ]
description = ["Blue Bottle Coffee is on the ground floor and is accessible from the outside of the building.  I got lost trying to find it, but if you go outside and look up the address on Google maps, make your way toward the pin from the outdoors, you should find it.
I was delighted to see that there’s a Blue Bottle location in Shinjuku.  You can expect the same quality here as you would at any other location.  The staff is friendly and quick.  The craftsmanship is excellent, just what you’d expect from Blue Bottle.  I got a New Orleans drink here, and it tasted just like the one from their New York City shops.  The lines can get long, and there is not much seating available, but there are some benches outside.  The shop indoors across from Blue Bottle has fun culinary accouterments to look at if you’d like to take a small stroll inside.
Enjoy!", "howa Memorial Park is a 165 hectare National Government Park about a 40 minute train ride from Shinjuku Station. The park is great to visit year round with seasonal flowers adding some colour even through the winter months. Noteworthy is the crisscrossed network of cycling paths and bikes including tandem’s are available for hire. In addition the park includes several playgrounds including a Children’s Forest and rainbow pool, BBQ facilities and for couples looking for something quieter there is always pedal boating on the artificial lake.
 Access: From Shinjuku take a Chuo Line train bound for Ome and get off at Nishi Tachikawa Station which closest to the park. Entry fee adults 410 yen / children 80 yen."]



urls = [
  "http://res.cloudinary.com/dqeebh2l0/image/upload/v1509071151/coffee_shop_vsellz.jpg",
  "http://res.cloudinary.com/dqeebh2l0/image/upload/v1509071106/Tourism_sjygvr.jpg",
  "http://res.cloudinary.com/dqeebh2l0/image/upload/v1509071086/bar_e58txp.jpg",
  "http://res.cloudinary.com/dqeebh2l0/image/upload/v1509071064/gym_prbaqd.jpg",
  "http://res.cloudinary.com/dqeebh2l0/image/upload/v1509071049/spa_jaml87.jpg"
]

puts 'Created categories'

Experience.transaction do
  categories_array.each do |category|
    rand(2..6).times do
      exp = Experience.new(
        title: title.sample,
        description: description.sample,
        incentive: incentive.sample,
        location: place.sample,
        #availability: weekdays.sample,
        user_id: User.order("RANDOM()").first.id,
        category: category#s#_array.sampl
        )
      exp.photo_urls = urls
      rand(2..4).times do
        exp.schedules.build(date: Faker::Date.forward(30))
      end
      exp.save!

      puts "Added an experience"
    end
  end
end

puts 'created experiences'

10.times do
Booking.create!(
  date: Faker::Date.forward(30),
  user_id: User.order("RANDOM()").first.id,
  experience_id: Experience.order("RANDOM()").first.id
  )
end

puts 'created bookings'
20.times do
UserCategory.create!(
  user_id: User.order("RANDOM()").first.id,
 category: categories_array.sample
  )
end

