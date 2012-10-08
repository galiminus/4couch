class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(current_user.id)
    password_changed = !params[:user][:password].empty?

    successfully_updated =
      if password_changed
        @user.update_with_password(params[:user])
      else
        params[:user].delete :current_password
        @user.update_without_password(params[:user])
      end

    if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end
end
