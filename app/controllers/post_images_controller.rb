class PostImagesController < ApplicationController
  
  # 画像の新規投稿
  def new
    # form_withに渡すための空のモデルを用意
    @post_image = PostImage.new
  end

  def index
  end

  def show
  end
  
  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    # current_userは現在ページの.以降の内容を取得できるdeviseのヘルパーメソッド
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end
  
  # 投稿データのストロングパラメータを記述
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
