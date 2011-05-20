module ApplicationHelper
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  def nice_link(link_class, name, path, opts={})
    link_class += (current_page?(path) ? ' current' : '')
    content_tag :li, :class => link_class do
      link_to name, path, opts
    end
  end
end
