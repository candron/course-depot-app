class Product < ActiveRecord::Base
default_scope :order=> 'price'
validates :title, :description, :image_url, :price, :presence=>true
validates :title, :uniqueness=>true
validates :price, :numericality=>{:greater_than_or_equal_to=>0.01}
validates :image_url, :format=>{:with=>%r{\.(gif|jpg|png)$}i, :message=>"Must be JPG or PNG or GIF"}
end
