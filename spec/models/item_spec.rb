require 'rails_helper'
RSpec.describe Item do
  describe '出品機能に関して' do
    describe '商品名' do
      it "商品名が空欄だと保存されない" do
        item = FactoryBot.build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end
      it "商品名が空欄だと保存されない" do
      end
    end
  end
end