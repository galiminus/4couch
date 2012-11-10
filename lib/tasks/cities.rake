# encoding: utf-8

namespace :cities do
  task :init => :environment do
  end

  task :load => :init do
    # Load all countries
    countries = {}
    File.open("#{Rails.root}/data/countries.txt").each do |line|
      infos = line.split("\t")
      code = infos[0]
      name = infos[4]
      countries[code] = name
    end

    # Load admin1 codes
    admin1 = {}
    File.open("#{Rails.root}/data/admin1CodesASCII.txt").each do |line|
      infos = line.split("\t")
      code = infos[0]
      name = infos[1]
      admin1[code] = name
    end

    # Load admin2 codes
    admin2 = {}
    File.open("#{Rails.root}/data/admin2Codes.txt").each do |line|
      infos = line.split("\t")
      code = infos[0]
      name = infos[1]
      admin2[code] = name
    end

    File.open("#{Rails.root}/data/cities.txt").each do |line|
      infos = line.split("\t")

      id = infos[0]
      name = infos[1]
      admin1_code = infos[10]
      admin2_code = infos[11]
      country_code = infos[8]
      population = infos[14]
      lat = infos[4]
      lng = infos[5]

      City.create(:id => id,
                  :name => name,
                  :admin1 => admin1["#{country_code}.#{admin1_code}"],
                  :admin2 => admin2["#{country_code}.#{admin1_code}.#{admin2_code}"],
                  :country => countries[country_code],
                  :population => population,
                  :lat => lat,
                  :lng => lng)
    end
  end
end
