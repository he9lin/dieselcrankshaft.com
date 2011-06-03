class ProductsController < ApplicationController
  layout 'product'
  
  inherit_resources
  expose(:products) { @products }
end
