module ApplicationHelper
  def locales_collection
    I18n.available_locales.inject({}) do |collection, locale|
      collection[t("locales.#{locale}")] = locale; collection
    end
  end

  def edit_user_section_path(user, section)
    "/users/#{user.slug}/edit/#{section}"
  end

  def user_section_path(user, section)
    "/users/#{user.slug}/#{section}"
  end

  def current_section
    (params[:section] || :profile).to_sym
  end
end
