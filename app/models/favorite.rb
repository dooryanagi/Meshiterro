class Favorite < ApplicationRecord
  
  # いいねはユーザーにも画像にも属している、単数形
  belongs_to :user
  belongs_to :post_image
  
  # いいねが一人一回しかできないようにバリデーションで制限する（データベースに制限を行うことも可能）
  # unlessで、すでにテーブルに保存されている値との重複の有無を確認
  # user_idはvaridatesの引数
  # scopeでその値に対して確認するかを指定する
  validates :user_id, uniqueness: {scope: :post_image_id}
  
end
