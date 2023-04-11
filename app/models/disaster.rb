class Disaster < ApplicationRecord
  validates :name, presence: true

  has_many :post_disaster_ships, dependent: :restrict_with_error
  has_many :posts, through: :post_disaster_ships
end
