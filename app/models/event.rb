class Event < ApplicationRecord
  alias_attribute :manager, :user

  belongs_to :user
  has_many :participants

  validates :title, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validate :end_must_be_after_start

  private

  def end_must_be_after_start
    if DateTime.new(start_time.to_i) > DateTime.new(end_time.to_i)
      errors.add(:end_time, "must be after start time")
    end
  end
end
