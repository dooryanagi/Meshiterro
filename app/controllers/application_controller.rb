class ApplicationController < ActionController::Base
  
  # deviseのコントローラは直接修正できないため、全てのコントローラに対する処理を行える権限を持つこの場所に記述する
  # before_actionにより、devise機能の前にメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # privateと似た機能を持つが、protectedは他のコントローラーからも参照
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
