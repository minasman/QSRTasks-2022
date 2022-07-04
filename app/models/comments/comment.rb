class Comment < ApplicationRecord
  belongs_to :organization
  belongs_to :store
  belongs_to :user
  belongs_to :guest
  has_many :comment_updates, inverse_of: :comment, dependent: :delete_all
  accepts_nested_attributes_for :comment_updates
  validates :case_number, uniqueness: true
  before_save :format_content

  include PgSearch::Model
  pg_search_scope :search,  associated_against: {store: [:number, :name]}, using: {tsearch: {prefix: true}}

  COMMENT_TYPES = %w[Complaint Compliment Inquiry]
  SOURCE = ['1-800#', 'VOICE', 'Local']
  URGENT = %w[General Urgent]
  CONTACT_TYPE = %w[Phone Email Mail Voice Other]
  ORDER_POINT = %w[DT FC Mobile Kiosk Delivery Other]
  STATUS = %w[Open Closed]

  scope :open_comment, -> { where(status: 'Open', comment_type: 'Complaint', organization_id: current_user.organization.id) }
  scope :ytd_800_complaints, -> { where(visit_date: Time.now.beginning_of_year..Time.now, source: '1-800#', comment_type: 'Complaint') }
  scope :qtd_800_complaints, -> { where(visit_date: Time.now.beginning_of_quarter..Time.now, source: '1-800#', comment_type: 'Complaint') }
  scope :mtd_800_complaints, -> { where(visit_date: Time.now.beginning_of_month..Time.now, source: '1-800#', comment_type: 'Complaint') }
  scope :wtd_800_complaints, -> { where(visit_date: Time.now.beginning_of_week..Time.now, source: '1-800#', comment_type: 'Complaint') }

  scope :ytd_local_complaints, -> { where(visit_date: Time.now.beginning_of_year..Time.now, source: 'Local', comment_type: 'Complaint') }
  scope :qtd_local_complaints, -> { where(visit_date: Time.now.beginning_of_quarter..Time.now, source: 'Local', comment_type: 'Complaint') }
  scope :mtd_local_complaints, -> { where(visit_date: Time.now.beginning_of_month..Time.now, source: 'Local', comment_type: 'Complaint') }
  scope :wtd_local_complaints, -> { where(visit_date: Time.now.beginning_of_week..Time.now, source: 'Local', comment_type: 'Complaint') }

  def guest_attributes=(guest)
    self.guest = Guest.find_or_initialize_by(first_name: (guest[:first_name]).strip.downcase.titleize, last_name: (guest[:last_name]).strip.downcase.titleize, phone: (guest[:phone]).strip) do |g|
      g.first_name = guest[:first_name].strip.downcase.titleize
      g.last_name = guest[:last_name].strip.downcase.titleize
      g.email = guest[:email].strip.downcase
      g.phone = guest[:phone].strip
      g.save
    end
  end

  def format_content
    self.case_number = case_number.to_s.downcase.strip
    self.first_issue = first_issue.titleize.strip
    self.second_issue = second_issue ? second_issue.titleize.strip : ''
    self.third_issue = third_issue ? third_issue.titleize.strip : ''
    self.employee_named = employee_named ? employee_named.titleize.strip : ''
  end

end
