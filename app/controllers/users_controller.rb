class UsersController < ApplicationController

  # ユーザーの情報の取得、表示
  def show
    # URLに記載されたIDを参考に必要なUserモデルを取得する
    @user = User.find(params[:id])
    # アソシエーションにより.post_imagesとすることで指定したデータを取得できる
    @post_images = @user.post_images.page(params[:page])
  end

  #ユーザー情報の編集
  def edit
    @user = User.find(params[:id])
  end

  # 更新
  def update
    @user = User.find(params[:id])
    # (user_params)が必要？
    @user.update(user_params)
    # (user.id)が必要？
    redirect_to user_path(@user.id)
  end

  private
  # ストロングパラメータ

  # updateを定義するときに追加
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
