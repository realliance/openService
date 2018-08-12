class Event < ApplicationRecord
  alias_attribute :manager, :user

  belongs_to :user
  has_many :participants

  validates :title, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :participant_slots, presence: true
  validates :participant_slots, numericality: { only_integer: true, greater_than: 0 }

  validate :end_must_be_after_start

  def full?
    participant_slots <= participants.count
  end

  def finished?
    DateTime.now > end_time
  end

  def total_hours
    ((end_time - start_time) * 24).to_i
  end

  private

  def end_must_be_after_start
    if DateTime.new(start_time.to_i) > DateTime.new(end_time.to_i)
      errors.add(:end_time, "must be after start time")
    end
  end
end
