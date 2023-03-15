class User < ApplicationRecord
  has_many :tickets
  
  validates :name, :email, :password, :phone, :user_name, :role, presence: true
  validates :phone, length: {is: 11}, numericality: { only_integer: true }
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :email, :user_name, uniqueness: {message: 'has already been taken'}
  enum role: [:user, :admin]
end
