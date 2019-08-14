require 'rails_helper'
RSpec.describe MypagesController, type: :controller do

  before do
    @user = create(:user)
    @address = create(:address)
  end

  describe 'get #show' do
    it "showアクションのビューに推移するかどうか" do
      get :show, params: { id: 1 } 
      expect(response).to render_template :show
    end
  end

  describe 'get #profile' do
    it "profileアクションのビューに推移するかどうか" do
      get :profile, params: { id: 1 }
      expect(response).to render_template :profile
    end
  end

  describe 'get #identification' do
    it "identificationアクションのビューに推移するかどうか" do
      get :identification, params: { id: 1 }
      expect(response).to render_template :identification
    end
  end
  
end