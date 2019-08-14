class TransactionController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, :set_user

  def index
    @image = Image.find_by(item_id: @item.id)
    @address = @user.addresses

    card = Card.where(user_id: current_user.id).first
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to "/"
    else
      Payjp.api_key = "sk_test_8a3bd63574f274676a543f16"
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_8a3bd63574f274676a543f16"
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  item = @item.update(status: 1)

  transaction = Transaction.create(
    user_id: @user.id,
    item_id: @item.id
  )

  redirect_to '/' #完了画面に移動
  end

  private
    
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
