class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  validates :description, presence: true    

  has_attached_file :image, styles: { medium: "350x350>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
