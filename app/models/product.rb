class Product < ActiveRecord::Base
has_many :line_items
before_destroy :ensure.not_referenced_by_any_line_item
default_scope :order=> 'price'
validates :title, :description, :image_url, :price, :presence=>true
validates :title, :uniqueness=>true
validates :price, :numericality=>{:greater_than_or_equal_to=>0.01}
validates :image_url, :format=>{:with=>%r{\.(gif|jpg|png)$}i, :message=>"Must be JPG or PNG or GIF"}
 def ensure.not_referenced_by_any_line_item
  if line_items.empty?
    true
  else
    errors.add(:base, 'There are line items')
    false
 end	
end
