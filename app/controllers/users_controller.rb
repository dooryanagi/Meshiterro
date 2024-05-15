class UsersController < ApplicationController
  def show
    # URLに記載されたIDを参考に必要なUserモデルを取得する
    @user = User.find(params[:id])
    # アソシエーションにより.post_imageとすることで指定したデータを取得できる
    @post_images = @user.post_image
  end

  def edit
  end
end
