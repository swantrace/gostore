class Product < ActiveRecord::Base
  attr_accessible :category, :description, :image_url, :mark_as_new, :mark_as_sale, :material, :price, :quantity, :sale_price, :title
end
