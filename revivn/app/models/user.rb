class User < ApplicationRecord
  belongs_to :org
  has_many :pickups
end
