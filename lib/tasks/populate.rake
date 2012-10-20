namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    User.delete_all
    User.populate 2 do |user|
      user.email = Faker::Internet.email
      user.username = Populator.words(1).titleize
      user.encrypted_password = "password"
    end

    Community.delete_all
    Community.populate 20 do |community|
      community.name = Populator.words(1..3).titleize
      community.description = Populator.sentences(2..10)
      community.users = User.all.sample(10)
    end

    Couch.delete_all
    Couch.populate 100 do |couch|
      couch.title = Populator.words(1..3).titleize
      couch.description = Populator.sentences(2..10)
      couch.created_at = 2.years.ago..Time.now
      couch.latitude = rand(180) - 90
      couch.longitude = rand(180)
      couch.user = User.all.sample(1)
    end
  end
end
