class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :image_url, :mark_as_new, :mark_as_sale, :material, :price, :quantity, :sale_price, :title
  belongs_to :category
  validates :description, :title, :price, :presence => true
  validates :price, :numericality => true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)$}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private
   def ensure_not_referenced_by_any_line_item
     if line_items.empty?
       return true
     else
        errors.add(:base, 'Line Items present')
        return false
     end
   end
end