# frozen_string_literal: true

class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.text :description, null: false
      t.references :user, foreign_key: true
      t.string :image, null: false
      t.timestamps
    end
    add_index :microposts, %i[user_id created_at]
  end
end
