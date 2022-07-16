class NewHire < ApplicationRecord
  belongs_to :organization
  belongs_to :store
  belongs_to :user
  belongs_to :position

  include PgSearch::Model
  pg_search_scope :search, associated_against: {
    store: [:number, :name],
    position: [:name]
  },
  against: [:first_name, :last_name],
  using: {tsearch: {prefix: true}}

  validates :social, :rate, numericality: true
  validates :social, length: { is: 5 }
  validates :email, uniqueness: true
  validates :phone, phone: true

  before_save :format_content

  HEAR = ['McHire.com', 'Indeed.com', 'In Store', 'Banner/Flyer/Brochure', 'Referral', 'Other'].freeze
  REQUIREMENTS = ['J1 Students', 'Translation - Spanish', 'Translation - Farsi', 'Translation - Arabic', 'Tranlation - Other', 'Job/Life Coach', 'None'].freeze

  def full_name
    first_name + ' ' + last_name
  end

  def format_content
    self.first_name = first_name.strip.titleize
    self.last_name = last_name.strip.titleize
    self.phone = phone.strip
    self.email = email.strip.downcase
    self.social = social.strip
    self.rate = rate.strip
    self.referred_by = referred_by.strip.titleize
  end
end
