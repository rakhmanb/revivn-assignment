class Pickup < ApplicationRecord
  has_many :pickup_items, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :pickup_items
  belongs_to :pickup_status
end
