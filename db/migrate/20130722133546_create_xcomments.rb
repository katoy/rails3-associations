class CreateXcomments < ActiveRecord::Migration
  def change
    create_table :xcomments do |t|
      t.string :user_name
      t.text :body
      t.references :idea, index: true

      t.timestamps
    end
    add_index :xcomments, :idea_id
  end
end
