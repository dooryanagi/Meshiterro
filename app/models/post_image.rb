class PostImage < ApplicationRecord

  # 画像を持たせるための記述を追加
  has_one_attached :image

  # １：NのNに相当する記述を追加する
  # 画像側から見るとuserは常に1のため、単数形
  belongs_to :user

end
