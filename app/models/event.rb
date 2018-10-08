class Event < ApplicationRecord
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'

  has_many :participants

  validates :title, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :participant_slots, presence: true
  validates :participant_slots, numericality: { only_integer: true, greater_than: 0 }

  validate :end_must_be_after_start

  scope :finished_events, -> { where('end_time < ?', DateTime.now) }
  scope :unfinished_events, -> { where('end_time > ?', DateTime.now) }

  def full?
    participant_slots <= participants.count
  end

  def finished?
    DateTime.now > end_time
  end

  def unfinished?
    !finished?
  end

  def total_hours
    ((end_time - start_time) / 3600).to_f
  end

  private

  def end_must_be_after_start
    errors.add(:end_time, 'must be after start time') if DateTime.new(start_time.to_i) > DateTime.new(end_time.to_i)
  end
end
