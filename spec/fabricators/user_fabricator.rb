Fabricator(:user) do
  email { Faker::Internet.email }  
  username { Populator.words(1).titleize }
  after_build do |user|
    user.password = "password"
    user.password_confirmation = "password" 
  end             
end
