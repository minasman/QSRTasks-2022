class Guest < ApplicationRecord
  belongs_to :organization
  has_many :comments, dependent: :delete_all
  has_many :stores, through: :comments

  def full_name
    first_name + ' ' + last_name
  end
end
