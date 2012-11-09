class Place
  def self.create(params = {})
    Tire.index 'places' do
      store({
              :id               => params[:id],
              :name             => params[:name],
              :admin1           => params[:admin1],
              :admin2           => params[:admin2],
              :country          => params[:country],
              :population       => params[:population].to_i,
              :lat              => params[:lat].to_f,
              :lng              => params[:lng].to_f
      })

      refresh
    end
  end

  def self.search(query_string, options = {})
    query_string ||= '*'
    Tire.search 'places' do
      query do
        string query_string, :default_operator => 'AND'
      end
      sort { by :population, 'desc' }
    end.results
  end
end
