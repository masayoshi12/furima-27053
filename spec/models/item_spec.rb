require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '商品出品できるとき' do
      it '全ての項目が存在すれば登録できる事' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it '画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it '商品説明が空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'カテゴリーが選ばれてないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it '商品の状態が選ばれてないと登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "State must be other than 1"
      end
      it '発送料の負担が選ばれてないと登録できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee must be other than 1"
      end
      it '発送元の地域が選ばれてないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it '配送日が選ばれてないと登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Day must be other than 1"
      end
      it '商品価格が空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '商品価格が半角数字以外では登録できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '商品価格が¥300以下では登録できない' do
        @item.price =  299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '商品価格が¥9,999,999以上では登録できない' do
        @item.price =  10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
    end
  end
end
