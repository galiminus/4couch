class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale, :set_search_query_placeholder

  def set_locale
    if current_user.present? and current_user.locale.present?
      I18n.locale = current_user.locale
    else
      I18n.locale = :en
    end
  end

  def set_search_query_placeholder
    @search_placeholder = params[:q] || t(:search_placeholder)
  end
end
