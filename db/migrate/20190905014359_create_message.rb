class CreateMessage < ActiveRecord::Migration[5.2]
  def change
    create_table :msgs do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :room, index: true, foreign_key: true, null: false
      t.text :content, null: false
    end
  end
end
