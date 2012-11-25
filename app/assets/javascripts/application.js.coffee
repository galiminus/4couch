#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap

$ ->
  $(".search-city").typeahead
    minLength: 3,
    items: 20,
    source: (query, process) =>
      $.get "/cities", { q: query }, (cities) =>
        
        @cities = {}
        process $.map(cities, (city) =>
          name = "#{city.name} - #{city.admin1}, #{city.country}"
          @cities[name] = city
          return name
        )
      
    updater: (name) =>
      $(location).attr href: "/places?q=#{name}&lat=#{@cities[name].lat}&lng=#{@cities[name].lng}"
      return name

