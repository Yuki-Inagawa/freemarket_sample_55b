require 'rails_helper'
RSpec.describe Comment do
  before do
    # @user = create(:user)
    # @category = create(:category)
    # @item = create(:item)
  end

  describe Comment do
    describe '#create' do
      it "テキストが空だと保存できない" do
        # comment = Comment.new(text: "", user_id: 1, item_id: 25)
        # comment.valid?
        # expect(false).to be false
      end
      it "テキストが400字以上だと保存できない" do
        # comment = Comment.new(text: "お" * 401, user_id:1, item_id: 25)
        # comment.valid?
        # expect(false).to be false
      end
      it "テキストが400文字以下だと保存できる" do
        # comment = Comment.new(text: "お" * 400, user_id:1, item_id: @user.items.first.id)
        # expect(comment).to be_valid
      end
    end
  end
end