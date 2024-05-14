Rails.application.routes.draw do

  # モデルの作成時に自動生成
  # deviseを使用する際にURLとしてusersを含むことを示している
  devise_for :users
  
  # ルートパスを設定
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
