class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :rank, numericality: { only_integer: true }

  validates :email, presence: true, 'valid_email_2/email': true

  phony_normalize :phone_number, default_country_code: 'US'
  validates :phone_number, phony_plausible: true

  has_many :participants
  has_many :events
  has_many :announcements

  def full_name
    first_name + ' ' + last_name
  end

  def rank_name
    RANK_NAMES[rank]
  end

  def total_hours
    hours = 0
    participants.each do |participant|
      hours += participant.hours_gained
    end
    hours
  end

  def member?
    rank > 0
  end 

  def admin?
    rank > 1
  end

  def advisor?
    rank > 2
  end

  def superuser?
    rank == 4
  end
end
