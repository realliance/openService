class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, presence: true
  validates :event, presence: true

  validates :hours, presence: true

  validate :hours_valid


  def hours_gained
    return 0 unless event.finished?
    return hours
  end

  private

  def hours_valid
    return false unless event.present? && hours.present?
    errors.add(:hours, "must be less than the total event time") unless hours <= event.total_hours
  end
end