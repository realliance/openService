class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def active_for_authentication?
    super && !deactivated
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :rank, presence: true

  validates :email, presence: true, 'valid_email_2/email': true

  phony_normalize :phone_number, default_country_code: 'US'
  validates :phone_number, phony_plausible: true

  has_many :participants

  has_many :managed_events, class_name: 'Event', foreign_key: 'manager_id', inverse_of: 'manager'

  has_many :announcements

  enum rank: %i[guest member officer advisor superuser]

  def full_name
    first_name + ' ' + last_name
  end

  def rank_name
    rank.slice(0,1).capitalize + rank.slice(1..-1)
  end

  def total_hours
    hours = 0
    participants.each do |participant|
      hours += participant.hours_gained
    end
    hours
  end

  def admin?
    officer? || advisor? || superuser?
  end
end
