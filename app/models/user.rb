class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :phone_number, presence: true

  validates :email, presence: true, 'valid_email_2/email': true

  phony_normalize :phone_number, default_country_code: 'US'
  validates :phone_number, phony_plausible: true
end
