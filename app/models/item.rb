class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :state, :fee, :prefecture, :day
  
  belongs_to :user
  has_one_attached :image

  validates :image,:product_name, :explanation, :price, presence: true

  validates : :category_id, :state_id, :fee_id, :prefecture_id, :day_id, numericality: { other_than: 1 } 
end
