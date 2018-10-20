class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  VALID_MAIL_REGEX =  /\A[\w+\-]+@[a-z\d\.]+\.[a-z]+\z/
  validates :email, presence: true, format: { with: VALID_MAIL_REGEX }
  VALID_PASSWORD_REGEX =  /(?=.*?\d)(?=.*?[a-zA-Z])[0-9a-zA-Z]{8,32}/
  validates :password, length: {in: 8..32},format: { with: VALID_PASSWORD_REGEX }

  has_secure_password

  has_many :topics
  has_many :favorites, dependent: :destroy
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
end
