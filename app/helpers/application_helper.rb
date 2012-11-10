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
    (params[:section] || '').to_sym
  end

  def markdown(text)
    renderer = Redcarpet::Render::XHTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    redcarpet.render text.to_s
  end

  def user_place_path(user)
    if user.place
      place_path(user.place)
    else
      new_place_path
    end
  end
end
