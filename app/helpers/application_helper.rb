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

end