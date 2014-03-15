module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = 'Canine Connector'
    fancy_title = 'Canine Connector - "Find Family, Faster"'
    if page_title.empty?
      fancy_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
