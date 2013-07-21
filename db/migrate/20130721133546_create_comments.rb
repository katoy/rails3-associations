class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_name
      t.text :body
      t.references :idea, index: true, null: false

      t.timestamps
    end
    add_index :comments, :idea_id
  end
end
