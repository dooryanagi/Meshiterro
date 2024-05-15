class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # 自動生成、deviseで利用する機能が記述されている
  # パスワードの正確性を検証、ユーザ登録や編集削除、パスワードのリセット、ログイン情報の保存、emailのフォーマットなどのバリデーション
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # 1：Nの関連付けを行う
  # ユーザーと画像は、一人のユーザーに対してたくさんの画像となるため、ユーザーが1、画像がNとなる
  has_many :post_image, dependent: :destroy
  
  # userモデルに対してもActiveAtrageで画像を保存できるように設定する
  has_one_attached :profile_image
  
  # プロフィール画像がなかった場合にサンプルを表示させる設定と大きさを変更できるメソッドを定義する
  # 他でも呼び出せるよう、モデル内に定義する
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.varient(resize_to_limit: [width, height]).processed
  end
  
end
