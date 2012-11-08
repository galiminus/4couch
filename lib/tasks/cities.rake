# encoding: utf-8

namespace :cities do
  task :init => :environment do
  end

  task :load => :init do
    File.open("#{Rails.root}/data/cities.txt").each do |line|
      infos = line.split("\t")
      Place.create(:id => infos[0],
                   :name => infos[1],
                   :country => infos[8],
                   :population => infos[14],
                   :lat => infos[4],
                   :lng => infos[5])
    end
  end
end
