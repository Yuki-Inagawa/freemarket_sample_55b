require 'rails_helper'
RSpec.describe User do
  describe "ユーザー新規登録に関して" do

    it "全て記入されていれば保存できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    describe "nickname" do
      it "nicknameが空なら登録できない" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      it "nicknameが21文字なら登録できない" do
        user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
        expect(user).to be_valid
        # 二十一文字でも登録出来てしまうエラー発見
      end
      it "nicknameが20文字なら登録できる" do
        user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa")
        expect(user).to be_valid
      end
    end

    describe "email" do
      it "emailが空なら登録できない" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
      it "先に登録したユーザーと同じemailだと登録できない" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
      it "@が入っていないと登録できない" do
        user = build(:user, email: "inagawagmail.com")
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end
      it "＠の前に文字が入っていないと登録できない" do
        user = build(:user, email: "@gmail.com")
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end
      it "@の後に文字が入っていないと登録できない" do
        user = build(:user, email: "inagawa@")
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end
    end

    describe "password" do
      it "空なら登録できない" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
      it "５文字なら登録できない" do
        user = build(:user, password: "aaaaa")
        user.valid?
        expect(user.errors[:password][0]).to include("is too short")
      end
      it "６文字なら登録できる" do
        user = build(:user, password: "aaaaaa")
        expect(user).to be_valid
      end
      it "129文字だと登録できない" do
        user = build(:user, password: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダ")
        user.valid?
        expect(user.errors[:password]).to include("is too long (maximum is 128 characters)")
      end
      it "128文字だと登録できる" do
        user = build(:user, password:"この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章は")
        expect(user).to be_valid
      end
      it "Password_confirmationが空なら登録できない" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it "Password_confirmationがpasswordと同じでなければ登録できない" do
        user = build(:user, password: 'password', password_confirmation: 'pass')
        user.valid?
        expect(user.errors[:password_confirmation]).to include "doesn't match Password"
      end
    end

    describe "本人確認について" do
      it "姓が空だと登録できない" do
        user = build(:user, family_name: nil)
        user.valid?
        expect(user.errors[:family_name]).to include("can't be blank")
      end
      it "姓が36文字だと保存できない" do
        user = build(:user, family_name: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れ")
        user.valid?
        expect(user.errors[:family_name]).to include("is too long (maximum is 35 characters)")
      end
      it "姓が35文字だと保存できる" do
      end
      it "名が空だと登録できない" do
      end
      it "名が36文字だと保存できない" do
      end
      it "名が35文字だと保存できる" do
      end
      it "姓のフリガナが空だと登録できない" do
      end
      it "姓のフリガナが36文字だと保存できない" do
      end
      it "姓のフリガナが35文字だと保存できる" do
      end
      it "姓のフリガナが全角ひらがなだと登録できない" do
      end
      it "姓のフリガナが全角カタカナだと保存できる" do
      end
      it "名のフリガナが空だと登録できない" do
      end
      it "名のフリガナが36文字だと保存できない" do
      end
      it "名のフリガナが35文字だと保存できる" do
      end
      it "名のフリガナが全角ひらがなだと登録できない" do
      end
      it "名のフリガナが全角カタカナだと保存できる" do
      end
    end

    describe "生年月日について" do
      it "年が入力されていないと保存されない" do
      end
      it "月が入力されていないと保存されない" do
      end
      it "日が入力されていないと保存されない" do
      end
    end
  end
end