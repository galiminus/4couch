#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap

$ ->
  $(".search-city").typeahead
    minLength: 3,
    items: 20,
    source: (query, process) ->
      $.get "/cities", { q: query }, (places) ->
        process $.map(places, (place) -> "#{place.name} - #{place.admin1}, #{place.country}")
    updater: (name) ->
      $(location).attr href: "/places?q=#{name}" if @$element.data('forward')
