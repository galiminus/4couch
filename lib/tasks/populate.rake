namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    Couch.delete_all

    Couch.populate 100 do |couch|
      couch.title = Populator.words(1..3).titleize
      couch.description = Populator.sentences(2..10)
      couch.created_at = 2.years.ago..Time.now
      couch.latitude = rand(180) - 90
      couch.longitude = rand(180)
    end
  end
end
