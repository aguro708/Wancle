class CreateThemas < ActiveRecord::Migration[5.2]
  def change
    create_table :themas do |t|
    	t.integer :user_id
    	t.string :thema
    	t.datetime :deadline

      t.timestamps
    end
  end
end
