class PostDisasterShip < ApplicationRecord
  belongs_to :post
  belongs_to :disaster
end
