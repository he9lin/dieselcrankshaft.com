class Picture < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image, :styles => { :thumb => "150x150>" }
  
  validates_presence_of :name
end
