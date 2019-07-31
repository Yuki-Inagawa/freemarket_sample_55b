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
        expect(user.errors[:nickname]).to include("を入力してください")
      end
      it "nicknameが21文字なら登録できない" do
        user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
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
        expect(user.errors[:email]).to include("を入力してください")
      end
      it "先に登録したユーザーと同じemailだと登録できない" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end
      it "@が入っていないと登録できない" do
        user = build(:user, email: "inagawagmail.com")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end
      it "＠の前に文字が入っていないと登録できない" do
        user = build(:user, email: "@gmail.com")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end
      it "@の後に文字が入っていないと登録できない" do
        user = build(:user, email: "inagawa@")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end
    end

    describe "password" do
      it "空なら登録できない" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
      it "５文字なら登録できない" do
        user = build(:user, password: "aaaaa")
        user.valid?
        expect(user.errors[:password][0]).to include("6文字以上で入力してください")
      end
      it "６文字なら登録できる" do
        user = build(:user, password: "aaaaaa", password_confirmation: "aaaaaa")
        expect(user).to be_valid
      end
      it "129文字だと登録できない" do
        user = build(:user, password: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダ")
        user.valid?
        expect(user.errors[:password]).to include("は128文字以内で入力してください")
      end
      it "128文字だと登録できる" do
        user = build(:user, password:"この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章は", password_confirmation:"この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章は")
        expect(user).to be_valid
      end
      it "Password_confirmationが空なら登録できない" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation][0]).to include("とPasswordの入力が一致しません")
      end
      it "Password_confirmationがpasswordと同じでなければ登録できない" do
        user = build(:user, password: 'password', password_confirmation: 'pass')
        user.valid?
        expect(user.errors[:password_confirmation][0]).to include "とPasswordの入力が一致しません"
      end
    end

    describe "本人確認について" do
      it "姓が空だと登録できない" do
        user = build(:user, family_name: nil)
        user.valid?
        expect(user.errors[:family_name]).to include("を入力してください")
      end
      it "姓が36文字だと保存できない" do
        user = build(:user, family_name: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れ")
        user.valid?
        expect(user.errors[:family_name]).to include("は35文字以内で入力してください")
      end
      it "姓が35文字だと保存できる" do
        user = build(:user, family_name: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入")
        expect(user).to be_valid
      end
      it "名が空だと登録できない" do
        user = build(:user, farst_name: nil)
        user.valid?
        expect(user.errors[:farst_name]).to include("を入力してください")
      end
      it "名が36文字だと保存できない" do
        user = build(:user, farst_name: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れ")
        user.valid?
        expect(user.errors[:farst_name]).to include("は35文字以内で入力してください")
      end
      it "名が35文字だと保存できる" do
        user = build(:user, farst_name: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入")
        expect(user).to be_valid
      end
      it "姓のフリガナが空だと登録できない" do
        user = build(:user, family_name_ruby: nil)
        user.valid?
        expect(user.errors[:family_name_ruby]).to include("を入力してください")
      end
      it "姓のフリガナが36文字だと保存できない" do
        user = build(:user, family_name_ruby: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
        user.valid?
        expect(user.errors[:family_name_ruby]).to include("は35文字以内で入力してください")
      end
      it "姓のフリガナが35文字だと保存できる" do
        user = build(:user, family_name_ruby: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
        expect(user).to be_valid
      end
      it "姓のフリガナが全角ひらがなだと登録できない" do
        user = build(:user, family_name_ruby: "あああ")
        user.valid?
        expect(user.errors[:family_name_ruby]).to include("は不正な値です")
      end
      it "姓のフリガナが全角カタカナだと保存できる" do
        user = build(:user, family_name_ruby: "アアア")
        expect(user).to be_valid
      end
      it "名のフリガナが空だと登録できない" do
        user = build(:user, farst_name_ruby: nil)
        user.valid?
        expect(user.errors[:farst_name_ruby]).to include("を入力してください")
      end
      it "名のフリガナが36文字だと保存できない" do
        user = build(:user, farst_name_ruby: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
        user.valid?
        expect(user.errors[:farst_name_ruby]).to include("は35文字以内で入力してください")
      end
      it "名のフリガナが35文字だと保存できる" do
        user = build(:user, farst_name_ruby: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
        expect(user).to be_valid
      end
      it "名のフリガナが全角ひらがなだと登録できない" do
        user = build(:user, farst_name_ruby: "あああ")
        user.valid?
        expect(user.errors[:farst_name_ruby]).to include("は不正な値です")
      end
      it "名のフリガナが全角カタカナだと保存できる" do
        user = build(:user, farst_name_ruby: "アアア")
        expect(user).to be_valid
      end
    end

    describe "生年月日について" do
      it "年が入力されていないと保存されない" do
        user = build(:user, birthday_yiar: nil)
        user.valid?
        expect(user.errors[:birthday_yiar]).to include("を入力してください")
      end
      it "月が入力されていないと保存されない" do
        user = build(:user, birthday_month: nil)
        user.valid?
        expect(user.errors[:birthday_month]).to include("を入力してください")
      end
      it "日が入力されていないと保存されない" do
        user = build(:user, birthday_day: nil)
        user.valid?
        expect(user.errors[:birthday_day]).to include("を入力してください")
      end
    end
  end
end