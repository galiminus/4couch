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
    renderer = Redcarpet::Render::HTML.new link_attributes: {rel: 'nofollow', target: '_blank'}, filter_html: true
    extensions = {no_intra_emphasis: true, tables: true, fenced_code_blocks: true, autolink: true, strikethrough: true, superscript: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    redcarpet.render text.to_s
  end
end
