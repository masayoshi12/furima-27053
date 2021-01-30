FactoryBot.define do
  factory :buyer_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '100-0000' }
    prefecture_id { 2 }
    municipalities { '大田区' }
    house_number { '大森北０−０−０' }
    phone_number { Faker::Number.number(digits: 11) }
    user_id { 1 }
    item_id { 1 }
  end
end
