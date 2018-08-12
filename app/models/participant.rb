class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, presence: true
  validates :event, presence: true
  validates :hours, presence: true

  validate :hours_valid, if event.exists? && hours.exists?


  def hours_gained
    if event.finished?
      return hours
    else
      return 0
    end
  end

  private

  def hours_valid
    hours <= event.total_hours
  end
end
