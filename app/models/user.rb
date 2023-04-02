class User < ApplicationRecord
  validates :name, :email, :password, :phone, :user_name, :role, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :email, :user_name, uniqueness: {message: 'has already been taken'}
  enum role: [:user, :admin]
  phony_normalize :phone, default_country_code: 'BD'
end
