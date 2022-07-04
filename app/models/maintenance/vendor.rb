class Vendor < ApplicationRecord
  belongs_to :organization
  has_many :workorders

  before_save :format_content

  include PgSearch::Model
  pg_search_scope :search, against: [:name],  using: {tsearch: {prefix: true}}

  def format_content
    self.name = name.strip.titleize
    self.contact = contact.strip.titleize
    self.phone = phone.strip
    self.email = email.downcase.strip
  end
end
