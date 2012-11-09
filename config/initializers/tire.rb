require 'tire/http/clients/curb'

Tire.configure do
  logger 'log/elasticsearch.log'
  client Tire::HTTP::Client::Curb
end

Tire.index 'places' do
  create:mappings => {
    :places => {
      :properties   => {
        :id         => { :type => 'string', :index => 'not_analyzed'},
        :name       => { :type => 'string', :analyzed => 'keyword'  },
        :admin1     => { :type => 'string', :analyzed => 'keyword'  },
        :admin2     => { :type => 'string', :analyzed => 'keyword'  },
        :country    => { :type => 'string', :analyzed => 'keyword'  },
        :population => { :type => 'long',   :index => 'not_analyzed'},
        :lat        => { :type => 'float',  :index => 'not_analyzed'},
        :lng        => { :type => 'float',  :index => 'not_analyzed'}
      }
    }
  }
end
  
