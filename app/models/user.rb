class User < ApplicationRecord
  validates :name, :email, :password, :phone, :user_name, :role, presence: true
  validates :phone, length: {minimum: 11, maximum: 14}
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :email, :user_name, uniqueness: {message: 'has already been taken'}
  enum role: [:user, :admin]
end
