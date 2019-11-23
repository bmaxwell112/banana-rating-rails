# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'bmax', password: 'password')
User.create(username: 'lclaire', password: 'password')
User.create(username: 'dvd', password: 'password')
User.create(username: 'dcundiff', password: 'password')

banana = Banana.new(user_id: 1)
banana.save!
banana.image.attach(io: File.open('app/assets/images/banana.jpg'), filename: 'banana.jpg', content_type: 'image/jpg')

banana = Banana.new(user_id: 2, ripe: 2)
banana.save!
banana.image.attach(io: File.open('app/assets/images/banana.jpg'), filename: 'banana.jpg', content_type: 'image/jpg')

banana = Banana.new(user_id: 2, notripe: 4)
banana.save!
banana.image.attach(io: File.open('app/assets/images/banana.jpg'), filename: 'banana.jpg', content_type: 'image/jpg')

banana = Banana.new(user_id: 4)
banana.save!
banana.image.attach(io: File.open('app/assets/images/banana.jpg'), filename: 'banana.jpg', content_type: 'image/jpg')