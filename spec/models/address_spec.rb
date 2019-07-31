require 'rails_helper'
RSpec.describe Address do
  before do
    @user  = create(:user)
  end
  it "全て記入されていれば保存できる" do
    address = build(:address)
    expect(address).to be_valid
  end

  describe "住所登録に関して" do
    describe "郵便番号" do
      it "郵便番号が空だと登録されない" do
        address = build(:address, postal_code: nil)
        address.valid?
        expect(address.errors[:postal_code]).to include("を入力してください")
      end
      it "７桁だと保存されない" do
        address = build(:address, postal_code: "123456")
        address.valid?
        expect(address.errors[:postal_code]).to include("は不正な値です")
      end
      it "２桁ー４桁だと保存されない" do
        address = build(:address, postal_code: "12-3456")
        address.valid?
        expect(address.errors[:postal_code]).to include("は不正な値です")
      end
      it "４桁ー４桁だと保存されない" do
        address = build(:address, postal_code: "1234-5678")
        address.valid?
        expect(address.errors[:postal_code]).to include("は不正な値です")
      end
      it "３桁ー３桁だと保存されない" do
        address = build(:address, postal_code: "123-456")
        address.valid?
        expect(address.errors[:postal_code]).to include("は不正な値です")
      end
      it "３桁ー５桁だと保存されない" do
        address = build(:address, postal_code: "123-45678")
        address.valid?
        expect(address.errors[:postal_code]).to include("は不正な値です")
      end
    end

    describe "地域に関して" do
      it "都道府県が空だと保存されない" do
        address = build(:address, region: nil)
        address.valid?
        expect(address.errors[:region]).to include("を入力してください")
      end
      it "市区町村が空だと保存されない" do
        address = build(:address, city: nil)
        address.valid?
        expect(address.errors[:city]).to include("を入力してください")
      end
      it "番地が空だと保存されない" do
        address = build(:address, address_number: nil)
        address.valid?
        expect(address.errors[:address_number]).to include("を入力してください")
      end
    end
  end
end