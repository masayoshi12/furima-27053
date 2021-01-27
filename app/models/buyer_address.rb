class BuyerAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(buyer_id: buyer.id, postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end