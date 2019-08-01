class CardController < ApplicationController

  require "payjp"

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["sk_test_8a3bd63574f274676a543f16"]

    user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      farst_name: session[:farst_name],
      family_name_ruby: session[:family_name_ruby],
      farst_name_ruby: session[:farst_name_ruby],
      birthday_yiar: session[:birthday_yiar],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day]
    )
    address = user.addresses.new(
      user_id: user.id,
      postal_code: session[:postal_code],
      region: session[:region],
      city: session[:city],
      address_number: session[:address_number],
      building_name: session[:building_name],
      phone_number: session[:phone_number]
    )

    unless address.save
      redirect_to "/signup"
    end

    if params['payjp-token'].blank?
      redirect_to clear_compleate_signup_index_path
    else
      customer = Payjp::Customer.create(
      # description: '登録テスト', #なくてもOK
      # email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      # metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = user.card.new(user_id: user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to clear_compleate_signup_index_path
      else
        redirect_to "/signup"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["sk_test_8a3bd63574f274676a543f16"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["sk_test_8a3bd63574f274676a543f16"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

end
