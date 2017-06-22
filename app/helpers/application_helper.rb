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

end