module ApplicationHelper
  def locales_collection
    I18n.available_locales.inject({}) do |collection, locale|
      collection[t("locales.#{locale}")] = locale; collection
    end
  end
end
