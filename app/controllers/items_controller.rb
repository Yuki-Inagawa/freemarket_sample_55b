class ItemsController < ApplicationController
  # before_action :move_to_index, except: :index

  def index
    @items = Item.all.includes(:images).order('id DESC').limit(4)
    
    # binding.pry
  end

  def new 
    @item = Item.new
    @item.images.build
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      image_params[:images].each do |image|
      @item.images.create(image: image)
      end
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    gon.item = @item
    gon.item_images = @item.images
    
    require 'base64'
    gon.item_images_binary_datas = []
    
    if Rails.env.production?
    require 'aws-sdk'
      client = Aws::S3::Client.new(
                            region: 'ap-northeast-1',
                            access_key_id: Rails.application.credentials.aws[:access_key_id],
                            secret_access_key: Rails.application.credentials.aws[:secret_access_key],
                            )
      @item.item_images.each do |image|
        binary_data = client.get_object(bucket: 'freemarket-sample-55b', key: image.image_url.file.path).body.read
        gon.item_images_binary_datas << Base64.strict_encode64(binary_data)
      end

    else
      @item.images.each do |image|
        binary_data = File.read(image.image.file.file)
        gon.item_images_binary_datas << Base64.strict_encode64(binary_data)
      end
    
  end
end

  def update
    @item = Item.find(params[:id])

    # 登録済画像のidの配列を生成
    ids = @item.images.map{|image| image.id }
    # 登録済画像のうち、編集後もまだ残っている画像のidの配列を生成(文字列から数値に変換)
    exist_ids = registered_image_params[:ids].map(&:to_i)
    # 登録済画像が残っていない場合(配列に０が格納されている)、配列を空にする
    exist_ids.clear if exist_ids[0] == " "

    if (exist_ids.length != 0 || image_params[:images][0] != " ") && @item.update(item_params)

      # 登録済画像のうち削除ボタンをおした画像を削除
      unless ids.length == exist_ids.length
        # 削除する画像のidの配列を生成
        delete_ids = ids - exist_ids
        delete_ids.each do |id|
          @item.images.find(id).destroy
        end
      end

      # 新規登録画像があればcreate
      unless image_params[:images][0] == " "
        image_params[:images].each do |image|
          @item.images.create(image: image, item_id: @item.id)
        end
      end

      flash[:notice] = '編集が完了しました'
      redirect_to item_path(@item), data: {turbolinks: false}

    else
      flash[:alert] = '未入力項目があります'
      redirect_back(fallback_location: root_path)
    end

  end


  def destroy
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @image = @item.images[0]
    @other_items = Item.where("user_id= #{@item.user.id}").order('id DESC').limit(6)
    
  end

  def buy_confirmation
  end


private
  def item_params
    params.require(:item).permit(:name, :text, :state, :postage_type, :region, :shopping_date, :delivery_method, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def registered_image_params
    params.require(:registered_images_ids).permit({ids: []})
  end

  def image_params
    params.require(:new_images).permit({images: []})
  end
  
end
