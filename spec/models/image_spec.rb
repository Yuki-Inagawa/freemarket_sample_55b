require 'rails_helper'
describe Image do
  # before do
  #   # @user  = create(:user)
  #   # @item  = create(:item)
  # end

  describe "出品機能の出品画像に関して" do
    it "画像が１枚もアップロードされないと保存されない" do
      image = build(:image, image: nil)
      image.valid?
      expect(image.errors[:image]).to include("を入力してください")
    end
    it "画像がアップロードされていれば保存される" do
      # image = build(:image)
      # expect(image).to be_valid
      # image = Image.new(image: "abe.jpg", item_id: 1)
      # expect(image).to be_valid
    end
    # ↓複数画像機能実装後書きます
    it "画像が複数枚でも保存される" do
      # image = build(:image, image: "f.jpeg")
      # image = build(:image, image: "ikezaki.jpg")
      # expect(image).to be_valid
    end
  end
end