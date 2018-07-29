class Event < ApplicationRecord
  belongs_to :manager, inverse_of: 'managed_events'
  has_many: :participants

  validates :title, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :officer, presence: true
end
