require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  before do
    @user = create(:user)
  end

  describe 'GETメソッドのshowアクションについて' do
    it "該当するビューが描画されているか" do
        get :show, params: {id: @user.id}
        expect(response).to render_template :show
    end

  end

end
