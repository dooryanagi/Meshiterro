class ApplicationController < ActionController::Base

  # deviseのコントローラは直接修正できないため、全てのコントローラに対する処理を行える権限を持つこの場所に記述する
  # before_actionにより、devise機能の前にメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後の遷移先にAboutを指定する
  # このメソッドはdeviseが用意しているメソッド、デフォルトはルートパス、そのため変更が必要
  # resourceという引数にはログインを実行したUserモデルのデータであるインスタンスが格納されている
  def after_sign_in_path_for(resource)
    # ログイン後は一覧を表示できるよう変更
    post_images_path
  end

  # サインアウト後の遷移先にAboutを指定する
  # 同様に用意されているメソッド、デフォルトはルートパス
  def after_sign_out_path_for(resource)
    about_path
  end

  # privateと似た機能を持つが、protectedは他のコントローラーからも参照することができる
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
