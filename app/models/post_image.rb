class PostImage < ApplicationRecord

  # 画像を持たせるための記述を追加
  has_one_attached :image

end
