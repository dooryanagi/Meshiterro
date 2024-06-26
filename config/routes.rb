Rails.application.routes.draw do

  # ルートパスを設定
  root to: "homes#top"

  # モデルの作成時に自動生成
  # deviseを使用する際にURLとしてusersを含むことを示している
  devise_for :users


  # usersコントローラーの作成とともにデフォルトで作成されたルーティングをresourcesで書き換える
  resources :users, only: [:show, :edit, :update]

  # post_imagesコントローラーとアクションの作成によりできたルーティングをresourcesで書き換える
  # resourcesにonlyのオプションを追加することで、必要なルートみ作成できる
  # 画像に紐づくコメントのルーティングをする、画像とコメントは親子関係になる
  resources :post_images, only: [:new, :index, :show, :create, :destroy] do
    # do~end内に記述すると、親子関係のリンク・ルーティングを作成することができる
    # resourceという単数形にすると、URLにidが含まれなくなる
    # resourceはそれ自身のidがわからなくても関連するほかのモデルからidが特定できるときに用いることが多い
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # aboutアクションのルーティングを定義
  get 'homes/about' => "homes#about", as: 'about'
end
