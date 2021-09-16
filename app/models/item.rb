class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :area
  belongs_to :send_day
  has_one    :order
  has_one_attached :image

  validates :title, :description, :image, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  # validates :price, numericality: { other_than: 1 }

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :area_id
    validates :send_day_id
  end
end
