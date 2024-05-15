Rails.application.routes.draw do

  # ルートパスを設定
  root to: "homes#top"

  # モデルの作成時に自動生成
  # deviseを使用する際にURLとしてusersを含むことを示している
  devise_for :users


  # usersコントローラーの作成とともにデフォルトで作成されたルーティングをresourcesで書き換える
  resources :users, only: [:show, :edit]

  # post_imagesコントローラーとアクションの作成によりできたルーティングをresourcesで書き換える
  # resourcesにonlyのオプションを追加することで、必要なルートみ作成できる
  resources :post_images, only: [:new, :index, :show, :create, :destroy]




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # aboutアクションのルーティングを定義
  get 'homes/about' => "homes#about", as: 'about'
end
