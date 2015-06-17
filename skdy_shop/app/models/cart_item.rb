class CartItem < ActiveRecord::Base
  belongs_to :cart
  has_one    :menu
end
