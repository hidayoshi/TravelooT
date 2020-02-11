class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.string :description, null: false
      t.string :image, null: false
      t.timestamps
    end
  end
end
