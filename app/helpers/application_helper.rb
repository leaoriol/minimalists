module ApplicationHelper

  # returns base default title if no title is provided
  def full_title(page_title = '')
    base_title = "MinimaList"
    if page_title.empty?
      base_title
    else
      page_title
    end
  end

  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end

  def capitalize
    name.slice(0,1).capitalize + name.slice(1..-1)
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