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

      place = Place.create :description => Populator.sentences(2..10),
                           :lat => rand(360) - 180,
                           :lng => rand(360) - 180,
                           :user => user
    end
  end
end
