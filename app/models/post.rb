class Post < ApplicationRecord
   validates :title, presence: true
   validates :content, presence: true
   validates :address, presence: true

   has_many :comments, dependent: :restrict_with_error
   has_many :post_disaster_ships
   has_many :disasters, through: :post_disaster_ships
   belongs_to :user
   mount_uploader :image, ImageUploader
end