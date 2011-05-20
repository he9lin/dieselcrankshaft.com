class ProductsController < ApplicationController
  inherit_resources
  expose(:products) { @products }
end
