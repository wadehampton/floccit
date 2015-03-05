require 'faker'
 
 # Create Lists
 50.times do
   List.create!(
     title:  Faker::Lorem.sentence,
   )
 end
 lists = List.all
 
 # Create Item
 100.times do
   Item.create!(
     list: list.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{List.count} lists created"
 puts "#{Item.count} items created"