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
  
end
