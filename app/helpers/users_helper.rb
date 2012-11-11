module UsersHelper  
  def edit_or_new_user_place_path(user)
    if user.place
      edit_user_place_path(user)
    else
      new_user_place_path(user)
    end
  end

  def active_in_sign_up
    'active' if params[:controller] == 'registrations' &&
      params[:action] == 'new'
  end

  def active_in_sign_in
    puts params[:controller]
    puts params[:action]
    'active' if params[:controller] == 'devise/sessions' &&
      params[:action] == 'new'
  end

  def active_in_section(section, current)
    'active' if section == current_section
  end

  def active_in_new_or_edit_user_place
    'active' if params[:controller] == 'users_places' &&
      ['new', 'edit'].include?(params[:action])
  end

  def active_in_user(user)
    'active' if params[:controller] == 'users' &&
      @user.present? && @user == current_user
  end

  def active_in_my_place(user, place)
    'active' if (place.present? && user.place == place) ||
      (params[:controller] == 'users_places' && params[:action] == 'new')
  end

  def active_in_create_place
    'active' if params[:controller] == 'users_places' and params[:action] == 'new'
  end
end
