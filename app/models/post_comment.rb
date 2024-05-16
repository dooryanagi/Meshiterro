class PostComment < ApplicationRecord
  
  # ユーザーとコメントは、１ユーザーに対してNコメント、属している、単数形
  belongs_to :user
  # 画像とコメントは、1画像に対してNコメント、属している、単数形
  belongs_to :post_image
  
end
