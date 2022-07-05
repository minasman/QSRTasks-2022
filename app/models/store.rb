class Store < ApplicationRecord
  belongs_to :organization
  has_and_belongs_to_many :users
  has_many :positions, through: :users
  has_many :guests
  has_many :comments, dependent: :delete_all
  has_many :workorders
  has_many :equipment
  has_many :safe_audits

  include PgSearch::Model
  pg_search_scope :search, against: [:number, :name],  using: {tsearch: {prefix: true}}


  STORE_TYPE = %w[Traditional WM Office]

  validates :number, :name, :store_type, :phone, :email, :city, :state, :zip, :headset, :street, presence: true
  validates :safe, :headset, numericality: { only_integer: true }
  before_save :format_content

  def format_content
    self.name = name.strip.titleize
    self.street = street.strip.titleize
    self.city = city.strip.titleize
    self.state = state.strip.upcase
    self.zip = zip.strip
    self.phone = phone.strip
    self.email = email.strip.downcase
    self.safe = safe.strip
    self.headset = headset.strip
  end
end
