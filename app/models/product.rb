class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :image_url, :mark_as_new, :mark_as_sale, :material, :price, :quantity, :sale_price, :title
  belongs_to :category
  validates :description, :title, :price, :presence => true
  validates :price, :numericality => true
end
