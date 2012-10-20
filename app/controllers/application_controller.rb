class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    if current_user.present? and current_user.locale.present?
      I18n.locale = current_user.locale
    end
  end
end
