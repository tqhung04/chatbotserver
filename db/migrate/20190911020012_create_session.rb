class CreateSession < ActiveRecord::Migration[5.2]
  create_table :sessions, id: :string, primary_key: :session_id do |t|
    t.string :value, null: false
  end
end
