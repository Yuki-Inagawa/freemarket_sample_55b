require 'rails_helper'
RSpec.describe SignupController, type: :controller do
  before do
    @user = create(:user)
  end

  describe 'GETメソッドのindexアクションについて' do
    it "該当するビューが描画されているか" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GETメソッドのregistrationアクションについて' do
    it "該当するビューが描画されているか" do
      get :registration
      expect(response).to render_template :registration
    end
  end

  describe 'GETメソッドのsms_confirmationアクションについて' do
    it "該当するビューが描画されているか" do
    #   get :sms_confirmation
    #   expect(response).to render_template :sms_confirmation
    # end
  end

  describe 'GETメソッドのaddressアクションについて' do
    it "該当するビューが描画されているか" do
      # get :address
      # expect(response).to render_template :address
    end
  end

  describe 'GETメソッドのhow_payアクションについて' do
    it "該当するビューが描画されているか" do
      # get :how_pay
      # expect(response).to render_template :how_pay
    end
  end

  describe 'POSTメソッドのcreateアクションについて' do
    it "該当するビューが描画されているか" do
      post :create
      expect(response).to render_template :create
    end
  end

  describe 'GETメソッドのclear_compleateアクションについて' do
    it "該当するビューが描画されているか" do
      get :how_pay
      expect(response).to render_template :how_pay
    end
  end

end