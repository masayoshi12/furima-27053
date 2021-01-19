require 'rails_helper'
RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
     it "全ての項目が存在すれば登録できる事" do
       expect(@user).to be_valid
     end
    end

    context "新規登録できないとき" do
     it "nicknameが空だと登録できない" do
       @user.nickname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
     it "emailが空では登録できない" do
       @user.email = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailに＠マークが含まれていなければ登録できない" do
        @user.email = "ABCDEFGHIJK"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
     it "passwordが空では登録できない" do
       @user.password = ""
       @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
     end
     it "passwordが存在してもpassword_confirmationが空では登録できない" do
       @user.password_confirmation = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordが英数字混合６文字以上でないと登録できない" do
        @user.password = "1986122"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password = "kubo12masa"
        @user.password_confirmation ="kubo22masa" 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "名字が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "名字が全角日本語でないと登録できない" do
        @user.last_name = "kubo"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it "名字（カナ）が空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it "名字（カナ）が全角カタカナでないと登録できない" do
        @user.last_name_kana = "ｸﾎﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it "名前が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "名前が全角日本語でないと登録できない" do
        @user.first_name = "MASAYOSHI"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "名前(カナ）が空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "名前(カナ）が全角カタカナでないと登録できない" do
        @user.first_name_kana = "ﾏｻﾖｼ"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it "誕生日が空では登録できない" do
        @user.birthday= ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
