module ProductsHelper
  def prod_box(prod, &block)
    div_for prod, :class => prod_class(prod), &block
  end
  
  def prod_class(prod)
    [:brand, :model].map {|f| f.to_s + '_' + prod.send("#{f}_id").to_s }.join(' ')
  end
end
