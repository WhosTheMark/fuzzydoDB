module ApplicationHelper

  # Capitalize first letter of each word, downcase the other letters
  # including non-English letters
  def title(page_title)
    content_for :title, page_title.to_s.mb_chars.split.map(&:capitalize).join(' ')
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
