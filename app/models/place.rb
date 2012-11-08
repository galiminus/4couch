class Place
  def self.create(params = {})
    Tire.index 'places' do
      store({
              :id               => params[:id],
              :name             => params[:name],
              :country          => params[:country],
              :population       => params[:population].to_i,
              :lat              => params[:lat].to_f,
              :lng              => params[:lng].to_f
      })

      refresh
    end
  end

  def self.search(query, options = {})
    query_string = query.presence || '*'
    Tire.search('places') do |search|
      search.query do |query|
        query.string query_string, :default_operator => 'AND'
      end
      search.sort { by :population, 'asc' }
    end.results
  end
end
