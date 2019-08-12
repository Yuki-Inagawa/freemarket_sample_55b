require 'rails_helper'
describe ItemsController do
  let(:user) { create(:user) }

  context "ユーザーログアウト時の挙動" do
  end
  context "ユーザーログイン時の挙動" do
    describe 'GET #index' do
      before do
        get :index
      end
      it "indexのビューに遷移するか" do
        get :index
        expect(response).to render_template :index
      end
      it "@itemsの値がItemモデルの最新４つの商品になっているか" do
        @user = create(:user)
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
      it "newのビューに遷移するか" do
        expect(response).to render_template :new
      end
      it '@itemに新しい商品を割り当てること' do
        expect(assigns(:item)).to be_a_new(Item)
      end
    end
  
    describe 'POST #create' do
      it 'データベースに新しい商品が登録されること' do
        # expect{
        #   post :create, params: {
        #     item: attributes_for(:item)
        #   }
        # }.to change(Item, :count).by(1)
      end
      it 'rootにリダイレクトすること' do
        # @item = attributes_for(:item)
        # post :create, item: @item
        # expect(response).to redirect_to root_path
      end
    end
  end




end