module ApplicationHelper
  def nice_link(link_class, name, path, opts={})
    link_class += (current_page?(path) ? ' current' : '')
    content_tag :li, :class => link_class do
      link_to name, path, opts
    end
  end
end
