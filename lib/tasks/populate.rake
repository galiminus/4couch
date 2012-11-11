namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    User.delete_all
    Place.delete_all

    50.times do
      user = User.create :email => Faker::Internet.email,
                         :username => Populator.words(1).titleize,
                         :password => "password",
                         :password_confirmation => "password"

      place = Place.create :title => Populator.words(1..3).titleize,
                           :description => Populator.sentences(2..10),
                           :latitude => rand(360) - 180,
                           :longitude => rand(360) - 180,
                           :user => user
    end
  end
end
