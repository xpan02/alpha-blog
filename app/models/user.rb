class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  before_save {self.email = email.downcase }
  validates :username, presence: true, 
                       length: { minimum: 3,maximum: 25}, 
                       uniqueness: { case_sensitive: false }
  VALID_EMAIL_RIGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                  length: { maximum:105},
                  uniqueness: { case_sensitive: false },
                  format: { with: VALID_EMAIL_RIGEX,
                  message: "valid email address only" }
  has_secure_password
end