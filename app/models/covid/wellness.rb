class Wellness < ApplicationRecord
  belongs_to :organization
  belongs_to :store

  validates :first_name, :last_name, :q1, :q2, :q3, :q4, :temp, presence: true
  validates :temp, numericality: true

  scope :current, -> { where(created_at: (3.hours.ago..Time.zone.now), reported: false) }

  def self.send_update
    @checks = Store.all.order('id ASC')
    WellnessMailer.sickdaily(@checks).deliver_later
  end

  def self.update_reported
    checks = Store.all
    checks.each do |store|
      next unless store.wellnesses.current.any?
      store.wellnesses.current.each do |check|
        check.update(reported: true)
      end
    end
  end
end
