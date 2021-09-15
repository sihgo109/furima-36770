class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,        null: false
      t.text       :description,  null: false
      t.references :user,         null: false, foreign_key: true
      t.integer    :category_id,  null: false
      t.integer    :status_id,    null: false
      t.integer    :charge_id,    null: false
      t.integer    :area_id,      null: false
      t.integer    :send_day_id,  null: false
      t.integer    :price,        null: false
      t.timestamps
    end
  end
end

#カラム素材
# title	string	null: false
# description	text	null: false
# user	references	null: false, foreign_key: true
# category_id	integer	null: false
# status_id	integer	null: false
# charge_id	integer	null: false
# area_id	integer	null: false
# send_day_id	integer	null: false
# price	integer	null: false
