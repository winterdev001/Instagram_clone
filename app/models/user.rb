class User < ApplicationRecord
  acts_as_voter
  has_many :posts
  validates :fullname, presence: true, length: {maximum: 30}
  validates :username, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255}, 
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation {email.downcase!}
  has_secure_password
  validates :password,:password_confirmation, presence: true, length: {minimum: 6}

  has_attached_file :image, styles: { medium: "350x350>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
