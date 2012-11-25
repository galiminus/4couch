Fabricator(:place) do
  description { Populator.sentences(2..10) }
  latitude { rand(360) - 180 }
  longitude { rand(360) - 180 }
  user(fabricator: :user)
end
