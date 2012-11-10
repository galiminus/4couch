namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

#    User.delete_all
    User.populate 2 do |user|
      user.email = Faker::Internet.email
      user.username = Populator.words(1).titleize
      user.encrypted_password = "password"
    end

    Community.delete_all
    Community.populate 20 do |community|
      community.name = Populator.words(1..3).titleize
      community.description = Populator.sentences(2..10)
#      community.users = User.all.sample(10)
    end

    Place.delete_all
    Place.populate 100 do |place|
      place.title = Populator.words(1..3).titleize
      place.description = Populator.sentences(2..10)
      place.created_at = 2.years.ago..Time.now
      place.latitude = rand(180) - 90
      place.longitude = rand(180)
      place.city = ["Paris", "Montpellier", "Le Mans", "Strasbourg", "Pau"].sample
#      place.user_id = User.all.sample
    end
  end
end
