class Item < ApplicationRecord
  belongs_to :user
  has_one    :order

  validates :text, presence: true
end
