class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :confirmable, :lockable, :timeoutable, :trackable, :masqueradable

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
  has_many :auditor_safe_audits, class_name: "SafeAudit", foreign_key: "auditor_id"
  has_many :manager_safe_audits, class_name: "SafeAudit", foreign_key: "manager_id"
  has_many :employee_named_documentations, class_name: "Documentation", foreign_key: "employee_named_id"
  has_many :awarded_by_documentations, class_name: "Documentation", foreign_key: "awarded_by_id"

  scope :maint_list, -> { where(position_id: Position.where(department: 'Maintenance').ids).order("first_name") }
  scope :managers, -> {where(position_id: [5, 15], active: true).order(first_name: :asc)}
  scope :crew, -> {where(position_id: [26], active: true).order(first_name: :asc)}
  scope :first_week, -> {where(active: true, created_at: Date.today - 7.days..Date.today).order(first_name: :asc)}
  scope :second_week, -> {where(active: true, created_at: Date.today - 14.days..Date.today - 7.days).order(first_name: :asc)}
  scope :third_week, -> {where(active: true, created_at: Date.today - 21.days..Date.today - 14.days).order(first_name: :asc)}
  scope :fourth_week, -> {where(active: true, created_at: Date.today - 28.days..Date.today - 21.days).order(first_name: :asc)}
  scope :second_month, -> {where(active: true, created_at: Date.today - 2.months..Date.today - 28.days).order(first_name: :asc)}
  scope :third_month, -> {where(active: true, created_at: Date.today - 3.months..Date.today - 2.months).order(first_name: :asc)}

  include PgSearch::Model
  pg_search_scope :search, against: [:first_name, :last_name], using: {tsearch: {prefix: true}}

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
