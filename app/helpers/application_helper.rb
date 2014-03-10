module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = 'Canine Connector'
    fancy_title = 'Canine Connector - "Finding Fido, Faster"'
    if page_title.empty?
      fancy_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
