class Guest < ApplicationRecord
  belongs_to :organization
  has_many :comments, dependent: :delete_all
  has_many :stores, through: :comments

  include PgSearch::Model
  pg_search_scope :search, against: [:first_name, :last_name],  using: {tsearch: {prefix: true}}

  def full_name
    first_name + ' ' + last_name
  end
end
