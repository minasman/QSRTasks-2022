class Shop < ApplicationRecord
  belongs_to :store
  belongs_to :organization
  belongs_to :shopper, class_name: 'User'
  belongs_to :shift_manager, class_name: 'User'
  belongs_to :order_taker, class_name: 'User'
  belongs_to :cashier, class_name: 'User'
  belongs_to :presenter, class_name: 'User'
  belongs_to :pf_presenter, class_name: 'User'

  SHOP_TYPE = ["Drive Thru", "Front Counter", "Curbside", "Delivery"]


end
