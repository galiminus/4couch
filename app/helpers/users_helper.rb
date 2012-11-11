module UsersHelper  
  def edit_or_new_user_place_path(user)
    if user.place
      edit_user_place_path(user, user.place)
    else
      new_user_place_path(user)
    end
  end

  def in_new_or_edit_user_place?
    params[:controller] == 'users_places' &&
      ['new', 'edit'].include?(params[:action])
  end
end
