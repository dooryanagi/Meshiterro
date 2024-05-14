class PostImagesController < ApplicationController

  # 画像の新規投稿
  def new
    # form_withに渡すための空のモデルを用意
    @post_image = PostImage.new
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    # current_userは現在ページの.以降の内容を取得できるdeviseのヘルパーメソッド
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  # 投稿データの削除
  def destroy
    # データを一件取得
    post_image = PostImage.find(params[:id])
    # データの削除
    post_image.destroy
    # 一覧へリダイレクト
    redirect_to post_images_path
  end

  # 投稿データのストロングパラメータを記述
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
