class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, through: :chat_users
  has_many :chat_users
  has_many :messages

end
