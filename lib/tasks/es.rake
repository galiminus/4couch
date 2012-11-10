# encoding: utf-8

require 'rest-client'

namespace :es do
  task :init => :environment do
  end

  task :drop => :init do
    RestClient.delete 'http://localhost:9200/places/'
    RestClient.delete 'http://localhost:9200/communities/'
  end
end
