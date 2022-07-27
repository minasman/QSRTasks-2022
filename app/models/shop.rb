class Shop < ApplicationRecord
  belongs_to :store
  belongs_to :organization
  belongs_to :shopper, class_name: 'User'

  SHOP_TYPE = ["Drive Thru", "Front Counter", "Curbside", "Delivery"]


end
