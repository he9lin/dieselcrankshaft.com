class Product < ActiveRecord::Base
  has_many :pictures
  belongs_to :brand
  belongs_to :model
end
