class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.string :image_id
    	t.string :link
    	t.string :content
    	t.integer :user_id
    	t.integer :post_id

      t.timestamps
    end
  end
end
