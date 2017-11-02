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


phone = ["(251) 546-9442", "(125) 546-4478","(949) 569-4371", "(630) 446-8851", "(226) 906-2721","(671) 925-1352"]

name = ["Lucie Langenfeld", "Kris Kiss", "Anabel Ahmad","Fran Farley","Sabra Sayler"]

hobby =["Yoga", "Pets", "Dance", "Video games", "Sports", "Flying", "Swimming", "Book collecting","Joesph Josey","Bobby Burges"]

bio = ["My name is Cecil Lewis, and I am a survivor.  For weeks I daydreamed of my family’s vacation to Thailand.  That vacation was a much needed time away from my hectic hours as a lawyer in a medium-sized firm in Chicago.  But as it turned out my time there was not relaxing at all, life had a different plan.  While on that vacation, our hotel received word of a devastating tsunami set to hit land, we were to evacuate quickly.  Lucky for my family we were further uphill hiking that day when we heard the news. We left to find an even safer location just before the water came on shore. We survived the tsunami. It was an act of God. When we returned many days later we found our resort was no more.
 ", "Kate Thompson is a senior at Cuyahoga State University, originally from Los Angeles, California. This spring she will receive her B.A in English with a minor in Creative Writing. During her time at Cuyahoga State she worked closely with WriteYouth, a non-profit organization dedicated to promoting childhood literacy. With WriteYouth Kate has led creative writing workshops at over 20 elementary schools throughout the greater Chicago Area. As a writer Kate’s short stories and essays have appeared in numerous online publications, including most notably the Los Angeles Times this past winter. When Kate is not writing or leading workshops, she enjoys running, singing, and playing the piano.",
"My name is Hal Mulberts and I grew up on a farm in Kansas with my family of five.  Life was simple.  The vast fields bore witness to our curiosity, and as kids, we often took to the expansive backyard for our adventures.  As we got older we worked the land we lived on. It demanded tilling, planting, caring, fertilizing, and harvesting.  To repeat the process, it demanded rest.  I learned there is no other way to successfully farm than by obeying the rules of the land.   Infractions of these rules meant poor harvest or poor crops, and we knew having either meant scrimping in the next season.
My siblings and I participated in the farming.  Though for many days a week we would leave the farm to attend school. Soon we found a rhythm between both our duties.
I quckly understood the importance of preparation, hard work, and respect.  I applied these values to my endeavours by making an inventory of resources, planning my activities for efficiency, working on my goals every single day, and giving my body the necessary rest it needed to operate.  My upbringing has completely supported my development and I am thankful for it.
","Kate Thompson is a senior at Cuyahoga State University, originally from Los Angeles, California. This spring she will receive her B.A in English with a minor in Creative Writing. During her time at Cuyahoga State she worked closely with WriteYouth, a non-profit organization dedicated to promoting childhood literacy. With WriteYouth Kate has led creative writing workshops at over 20 elementary schools throughout the greater Chicago Area. As a writer Kate’s short stories and essays have appeared in numerous online publications, including most notably the Los Angeles Times this past winter. When Kate is not writing or leading workshops, she enjoys running, singing, and playing the piano.",
]

profile_url = ["http://res.cloudinary.com/dqeebh2l0/image/upload/v1509513548/p11_hvnrgy.png",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509513548/p9_qcyusy.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509513548/p4_mwjvyd.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509513547/p12_cmdqoq.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509513547/p6_oxl018.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509513547/p5_jsyjr8.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509513547/p8_ix6zgd.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509514307/p17_vm60e6.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509514307/p18_o4ll4x.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509514307/p18_o4ll4x.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509514307/p11_dghtsc.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509514307/p13_oobjtj.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509514306/p14_marm5h.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509514306/p15_bkykgu.jpg"]

14.times do |i|
  user = User.new(
  name: name.sample,
  email: Faker::Internet.email,
  phone: phone.sample,
  password: "123456",
  bio: bio.sample,
  hobbies: hobby.sample,
  confirmed_at: Time.now,
  photo_url: profile_url[i]
  )
  # user.photo_url = "https://source.unsplash.com/random/100x100"
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



#weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
incentive = ["Make Friends", "Get To Know The Area","Free Cup of Coffee", "$$$", "For Free!"]
title = ["Touristy Spots", "Best Cafe Ever", "Where to Workout", "Best Relaxation Spot"]

place = ["Meguro, Tokyo", "Harajuku, Tokyo", "shibuya, Tokyo", "shinjuku, Tokyo","Hikarigaoka, Tokyo", "Ginza, Tokyo", "Koenji, Tokyo", "Eibusu, Tokyo", "Yoyogi, Tokyo", "Shinagawa, Tokyo", "Naka-meguro, Tokyo", "Ueno, Tokyo", "Daikan-yama, Tokyo", "Yutenji, Tokyo", "Gotanda, Tokyo","Senzoku, Tokyo", "Kita-senzoku", "Ookayama, Tokyo", "Fudomea, Tokyo", "Musashi-Koyama, Tokyo"]
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


cat1_title =["Best Cafe Ever","Delicious Lattes","Try Cold Brew Coffee", "Secret Little Cafes",
"Where to get Aeropress","Fresh Roasted Beans","Green Caffeine"]

cat1_des = ["A little spot tucked away with great staff",
" delicious and affordable beverages",
"These lattes are made perfectly with great art on top of the foam",
"Cold brew coffee is low in acid and also deliciously smooth",
"Tiny cafes you’ll probably miss, not even on Google Maps",
"Aeropress is a new and handy technique of brewing fresh hot coffee",
"This awesome places roasts its own amazing coffee beans",
"Try out some lightly roasted coffee beans for more caffeine"]

cat1_url = ["http://res.cloudinary.com/dqeebh2l0/image/upload/v1509518978/cof2_a04slv.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509518979/cof5_jcvmgz.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509518980/cof3_dev9pv.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509518980/cof10_yk5pfe.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509518978/cof6_nh3jd0.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509518978/cof4_cprqwn.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509518979/coffee_shop_wuxjkb.jpg"
]


Experience.transaction do
  # categories_array.each do |category|
  6.times do
      exp1 = Experience.new(
        title: cat1_title.sample,
        description: cat1_des.sample,
        incentive: incentive.sample,
        location: place.sample,
        user_id: User.order("RANDOM()").first.id,
        category: category1,
        photo_urls: cat1_url.shuffle
        )
      #exp1.photo_urls = cat1_url[i]
      rand(2..4).times do
        exp1.schedules.build(date: Faker::Date.forward(30))
      end
      exp1.save!

      puts "Added an experiences to cat 1"
    end
end



cat2_title = ["Appletini or Cosmo?"," Where the best Martinis Live", "Downtown Tokyo Bars""Drinks You’ve Never Heard Of",
"Affordable Cocktails in the City", "Old-Fashioned Mixologists", "Speakeasy Type Club Downtown"]
cat2_des = ["Choose between two of the best cocktails", "Find the best spots for good martinis",
  " Go out on the town and experience nightlife"," Great spots for super creative cocktails",
  " Experience awesome clubs for great prices", "Great old-fashioned drinks from bygone eras",
  "Jazz clubs for history buffs"]

cat2_url = ["http://res.cloudinary.com/dqeebh2l0/image/upload/v1509519428/bar5_gfs3ap.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509519429/bar_f5jd4t.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509519429/bar2_iqloqp.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509519429/bar4_dtrpfa.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509519429/bar3_v2adcv.jpg"]
Experience.transaction do
  # categories_array.each do |category|
    4.times do
      exp2 = Experience.new(
        title: cat2_title.sample,
        description: cat2_des.sample,
        incentive: incentive.sample,
        location: place.sample,
        user_id: User.order("RANDOM()").first.id,
        category: category2,
        photo_urls: cat2_url.shuffle
        )
      #exp2.photo_urls = cat2_url[i]
      rand(2..4).times do
        exp2.schedules.build(date: Faker::Date.forward(30))
      end
      exp2.save!

      puts "Added an experiences to cat 2"
    end
end

cat3_url = ["http://res.cloudinary.com/dqeebh2l0/image/upload/v1509531829/g2_vvjvyy.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509531829/g5_lplshn.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509531830/gym_fnjzeu.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509531830/g4_pxfvbb.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509531830/g1_jhb9hd.jpg"]
cat3_title =["Alternatives to Crossfit","Lift Heavy Nearby",
"No Need for Machines at This Gym",
"Quiet Gym with Great Staff",
"Personal Training Within 5 Minutes",
"Work Hard Play Hard","Great Space for Yoga"]
cat3_des = ["To achieve something you’ve never had before, you must do something you’ve never done before.",
"You are born weak and die weak, what you are in between those two periods of time is up to you",
"Hard work beats talent when talent doesn’t work hard",
"Winners Train, Losers Complain"]

Experience.transaction do
  # categories_array.each do |category|
    4.times do
      exp3 = Experience.new(
        title: cat3_title.sample,
        description: cat3_des.sample,
        incentive: incentive.sample,
        location: place.sample,
        user_id: User.order("RANDOM()").first.id,
        category: category3,
        photo_urls: cat3_url.shuffle
        )
      #exp3.photo_urls = urls[i]
      rand(2..4).times do
        exp3.schedules.build(date: Faker::Date.forward(30))
      end
      exp3.save!

      puts "Added an experiences to cat 3"
    end
end



cat4_url = ["http://res.cloudinary.com/dqeebh2l0/image/upload/v1509531361/r1_y2vedm.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509531362/r3_ghjsfw.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509584319/r5_vsq5dh.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509531362/r4_cailc9.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509531361/r2_sk5ipe.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509584326/r6_sg4yqk.jpg"]

cat4_title = ["Onsens Which Accept Tattoos","Decompress in Japan’s Best Spas",
"Affordable Makeovers","A Short Weekend Spa Trip",
"Some Good Places for Manicure and Pedicures",
 "Relaxing Walks through the Park",
"Take Time to Rest After Work",]
cat4_des = ["These onsens are rare because they accept tattoos", "Some of the best spas in the area offer great places to relax and decompress",
  "If you want to get a makeover and feel great about yourself then these places are perfect",
  "If you’d like to spend just a quick weekend decompressing from a difficult job then these spots are going to be your favorite soon",
  "Sometimes you just need to get your fingernails pretty and sparkly", "Sometimes it’s just good to take a relaxing walk in the park among the wildlife and flowers",
  "If you just need a place to go and relax after work then these quiet places around town are great"]

Experience.transaction do
  # categories_array.each do |category|
    4.times do
      exp4 = Experience.new(
        title: cat4_title.sample,
        description: cat4_des.sample,
        incentive: incentive.sample,
        location: place.sample,
        user_id: User.order("RANDOM()").first.id,
        category: category4,
        photo_urls: cat4_url.shuffle
        )
      #exp4.photo_urls = urls[i]
      rand(2..4).times do
        exp4.schedules.build(date: Faker::Date.forward(30))
      end
      exp4.save!

      puts "Added an experiences to cat 4"
    end
end

cat5_url = ["http://res.cloudinary.com/dqeebh2l0/image/upload/v1509530763/t3_y3wznb.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509530763/t2_g6vllz.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509530763/t5_zjoqwo.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509530763/t4_jcq9po.jpg",
"http://res.cloudinary.com/dqeebh2l0/image/upload/v1509530763/t1_oay6c8.jpg"
]

cat5_des = ["Japan's best attractions are the ones no one cares about, like the Imperial Tombs in southern Osaka, the countless hiking trails that pass through abandoned mountain villages, etc.",
"Jigokudani Monkey Park is a famous hot spring area near Nagano,. The name Jigokudani (meaning “Hell’s Valley”), is due to steam and boiling water that bubbles out the frozen ground, surrounded by steep cliffs and formidably cold forests. It is famous for its large population of wild Snow Monkeys that go to the valley during the winter when snow covers the park. The monkeys descend from the steep cliffs and forest to sit in the warm hot springs, and return to the security of the forests in the evenings.",
"The Kiyomizu-dera Buddhist temple is located in Eastern Kyoto and can be traced back as far as the year 798. An indoor waterfall fed from the outside river keeps the temple in harmony with nature and not one nail was used in construction. While locals used to jump off the edge to have a wish granted (with a survival rate of 85.4%), modern visitors can enjoy the shrines and talismans and artwork on display without risking life and limb.",
"The Tokyo Tower is a testament to the advancement of technology and modern life. Inspired by the Eiffel tower design, it is the second tallest man-made structure in Japan and functions as a communications and observation tower. Visitors can climb the tower for unparalleled views of Tokyo and the surrounding areas as well as visit shops and restaurants.",
"The Great Buddha of Kamakura is a colossal outdoor representation of Amida Buddha, one of Japan’s most celebrated Buddhist figures. Cast in bronze, the Great Buddha stands at over 13 meters (40 feet) high and weighs nearly 93 tons. The statue reportedly dates from 1252. Although it originally was housed in a small wooden temple, the Great Buddha now stands in the open air as the original temple was washed away in a tsunami in the 15th century."
]
cat5_title =["Best Ramen in the City","Largest Shrine in the Prefecture",
"Electric Town","Beaches Great for Photos",
"Japan’s Spookiest Forests","Historical Sites",
"Wartime Memorials"
]

Experience.transaction do
  # categories_array.each do |category|
    4.times do
      exp5 = Experience.new(
        title: cat5_title.sample,
        description: cat5_des.sample,
        incentive: incentive.sample,
        location: place.sample,
        user_id: User.order("RANDOM()").first.id,
        category: category5,
        photo_urls: cat5_url.shuffle
        )
      #exp5.photo_urls = urls[i]
      rand(2..4).times do
        exp5.schedules.build(date: Faker::Date.forward(30))
      end
      exp5.save!

      puts "Added an experiences to cat 5"
    end
end

# 10.times do
# Booking.create!(
#   date: Faker::Date.forward(30),
#   user_id: User.order("RANDOM()").first.id,
#   experience_id: Experience.order("RANDOM()").first.id
#   )
# end

# puts 'created bookings'
# 20.times do
# UserCategory.create!(
#   user_id: User.order("RANDOM()").first.id,
#  category: categories_array.sample
#   )
# end

