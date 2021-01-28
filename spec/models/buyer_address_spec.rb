require 'rails_helper'
RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer_address = FactoryBot.build(:buyer_address)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '全ての項目が存在すれば購入できる事' do
        expect(@buyer_address).to be_valid
      end
    end
    
    context '商品購入できないとき' do
      it '郵便番号が空だと登録できない' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号に-が含まれていないと登録できない'do
        @buyer_address.postal_code = 12345678
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Postal code is invalid"
      end
      it '郵便番号が全角だと登録できない'do
      @buyer_address.postal_code = "１００−００００"
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include "Postal code is invalid"
      end
      it '都道府県が選ばれてないと登録できない' do
        @buyer_address.prefecture_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Prefecture must be other than 1"
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
        expect(@buyer_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号が数字以外だと登録できない' do
        @buyer_address.phone_number = 'ABC12345678'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include "Phone number is invalid"
      end
    end
  end
end
