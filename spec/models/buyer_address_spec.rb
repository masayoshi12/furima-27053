require 'rails_helper'
RSpec.describe BuyerAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id , item_id: @item.id)
    sleep 0.5
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '必須項目が存在すれば購入できる事' do
        expect(@buyer_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end
    
    context '商品購入できないとき' do
      it 'tokenが空では登録できないこと' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Token can't be blank"
      end
      it '郵便番号が空だと登録できない' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号に-が含まれていないと登録できない' do
        @buyer_address.postal_code = 12_345_678
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Postal code is invalid'
      end
      it '郵便番号が全角だと登録できない' do
        @buyer_address.postal_code = '１００−００００'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Postal code is invalid'
      end
      it '都道府県が選ばれてないと登録できない' do
        @buyer_address.prefecture_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it '市区町村が空だと登録できない' do
        @buyer_address.municipalities = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Municipalities can't be blank"
      end
      it '番地が空だと登録できない' do
        @buyer_address.house_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "House number can't be blank"
      end
      it '電話番号が空だと登録できない' do
        @buyer_address.phone_number = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号が全角だと登録できない' do
        @buyer_address.phone_number = '０９０１２３４５６７８'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号が数字以外だと登録できない' do
        @buyer_address.phone_number = 'ABC12345678'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号が12桁以上だと登録できない' do
        @buyer_address.phone_number = '123456789012'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'user_idが空だと登録できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空だと登録できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
