class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :id
      t.string :title
      t.text :content
      t.string :state
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
