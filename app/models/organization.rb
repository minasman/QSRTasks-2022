class Organization < ApplicationRecord
  has_many :users, dependent: :delete_all
  has_many :positions, dependent: :delete_all
  has_many :stores, dependent: :delete_all
  has_many :vendors, dependent: :delete_all
end
