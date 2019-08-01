require 'rails_helper'
describe ItemsController do
  before do
    @user = create(:user)
  end
  describe 'GET #index' do
    before do
      get :index
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it "indexのビューに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
    it "@itemsの値がItemモデルの最新４つの商品になっているか" do
      items = create_list(:item, 4)
      expect(assigns(:items)).to match(items.sort{|a, b| b.id <=> a.id })
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it "newのビューに遷移するが" do
      expect(response).to render_template :new
    end
    it '@itemに新しい商品を割り当てること' do
      expect(assigns(:item)).to be_a_new(Item)
    end
  end

  describe 'POST #create' do
    it 'データベースに新しい商品が登録されること' do
    end
  end

end