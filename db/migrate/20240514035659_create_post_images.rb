class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      
      # カラムを追加する（shop_name、caption、user_id）
      # t.データ型名　：カラム名
      t.string :shop_name
      t.text :caption
      t.integer :user_id
      
      t.timestamps
    end
  end
end
