module UsersHelper  
  def edit_or_new_user_place_path(user)
    if user.place
      user_place_path(user, user.place)
    else
      new_user_place_path(user)
    end
  end
end
