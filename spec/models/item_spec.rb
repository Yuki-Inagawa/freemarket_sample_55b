require 'rails_helper'
RSpec.describe Item do
  before do
    @user = create(:user)
  end

  describe '出品機能に関して' do
    it "存在しないuser_idだと保存されない" do
      item = build(:item, user_id: 2)
      item.valid?
      expect(item.errors[:user_id])
    end

    describe '商品名' do
      it "商品名が空欄だと保存されない" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end
      it "商品名が４１文字だと保存されない" do
        item = build(:item,name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        item.valid?
        expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
      end
      it "商品名が４０文字だと保存される" do
        item = build(:item,name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(item).to be_valid
      end
    end

    describe "商品の説明" do
      it "説明が空欄だと保存されない" do
        item = build(:item, text: nil)
        item.valid?
        expect(item.errors[:text]).to include("can't be blank")
      end
      it "1001文字だと保存されない" do
        item = build(:item, text: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きo")
        item.valid?
        expect(item.errors[:text]).to include("is too long (maximum is 1000 characters)")
      end
      it "1000文字だと保存される" do
        item = build(:item, text: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大き")
        expect(item).to be_valid
      end
    end

    describe "商品の状態" do
      it "選択されていないと保存されない" do
        item = build(:item, state: nil)
        item.valid?
        expect(item.errors[:state]).to include("can't be blank")
      end
    end

    describe "配送料の負担" do
      it "選択されていないと保存されない" do
        item = build(:item, postage_type: nil)
        item.valid?
        expect(item.errors[:postage_type]).to include("can't be blank")
      end
    end

    describe "配送の方法" do
      it "選択されていないと保存されない" do
        item = build(:item, delivery_method: nil)
        item.valid?
        expect(item.errors[:delivery_method]).to include("can't be blank")
      end
    end

    describe "発送元の地域" do
      it "選択されていないと保存されない" do
        item = build(:item, region: nil)
        item.valid?
        expect(item.errors[:region]).to include("can't be blank")
      end
    end

    describe "発送までの日数" do
      it "選択されていないと保存されない" do
        item = build(:item, shopping_date: nil)
        item.valid?
        expect(item.errors[:shopping_date]).to include("can't be blank")
      end
    end

    describe "価格" do
      it "空欄だと保存されない" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end
      it "文字だと保存されない" do
        item = build(:item, price: "あ")
        item.valid?
        expect(item.errors[:price]).to include("is not a number")
      end
      it "全角の数字だと保存されない" do
        item = build(:item, price: "１")
        item.valid?
        expect(item.errors[:price]).to include("is not a number")
      end
      it "２９９円だと保存されない" do
        item = build(:item, price: "299")
        item.valid?
        expect(item.errors[:price]).to include("must be greater than or equal to 300")
      end
      it "３００円だと保存される" do
        item = build(:item, price: "300")
        expect(item).to be_valid
      end
      it "10,000,000円だと保存されない" do
        item = build(:item, price: "10000000")
        item.valid?
        expect(item.errors[:price]).to include("must be less than or equal to 9999999")
      end
      it "9,999,999円だと保存される" do
        item = build(:item, price: "9999999")
        expect(item).to be_valid
      end
    end

  end
end