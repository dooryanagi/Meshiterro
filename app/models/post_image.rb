class PostImage < ApplicationRecord

  # 画像を持たせるための記述を追加
  has_one_attached :image

  # １：NのNに相当する記述を追加する
  # 画像側から見るとuserは常に1のため、単数形
  belongs_to :user
  # 画像とコメントは、１画像に対してNコメント、複数形
  has_many :post_comments, dependent: :destroy
  # 画像とコメントは１画像に対してNいいね、複数形
  has_many :favorites, dependent: :destroy

  #お店の名前と画像が存在しているかを確認するバリデーションを設定する 
  validates :shop_name, presence: true
  validates :image, presence: true

  # 画像を表示させる
  # ビューに記述すると何度も同じ記述をする必要があるためモデルに記述する（これにより使いまわすことも可能）
  # アクションとは異なる、特定の処理を名前で呼び出すことができるようになる
  # PostImageモデル内に記述することでカラムを呼び出すようにこのメソッドを呼び出せるようになる
  def get_image
    # 画像が設定されない場合は記載の場所に格納されている画像をデフォルト画像としてActiveStrageに格納し、その画像を表示する
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  # いいねが一人一回しかできないように制限する
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
