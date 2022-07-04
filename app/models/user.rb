class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :confirmable, :lockable, :timeoutable, :trackable, :masqueradable

  include PgSearch::Model
  pg_search_scope :search, against: [:first_name, :last_name],  using: {tsearch: {prefix: true}}

  before_save :format_content
  validates :phone, phone: true
  validates :rate, numericality: true

  belongs_to :organization
  belongs_to :position
  has_and_belongs_to_many :stores
  has_many :comments
  has_many :comment_updates
  has_many :workorders
  has_many :workorder_updates

  scope :maint_list, -> { where(position_id: Position.where(department: 'Maintenance').ids).order("first_name") }

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def format_content
    self.first_name = first_name.strip.titleize
    self.last_name = last_name.strip.titleize
    self.phone = phone.strip
    self.email = email.strip.downcase
    self.payroll_id = payroll_id.strip.downcase
  end
end
