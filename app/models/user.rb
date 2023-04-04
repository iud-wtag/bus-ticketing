class User < ApplicationRecord
  has_many :tickets, dependent: :destroy

  validates :name, :email, :password, :phone, :user_name, :role, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :email, :user_name, uniqueness: {message: 'has already been taken'}
  phony_normalize :phone, default_country_code: 'US'
  validates_format_of :phone, with: /\A\+?\d+\z/, message: 'is not a valid phone number'
  enum role: { user: 0, admin:1 }
end
