class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :fee 
  belongs_to :day
  
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :product_name
    validates :explanation 
    with_options format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality:{ greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 }
    end
  end
  validates :category_id, :state_id, :fee_id, :prefecture_id, :day_id, numericality: { other_than: 1 } 
end
