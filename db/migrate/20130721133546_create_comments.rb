class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_name, :limit => 32
      t.text :body,        :limit => 4000
      t.string :picture
      t.references :idea, index: true, null: false

      t.timestamps
      t.integer:lock_version, :default => 0
    end
    add_index :comments, :idea_id
  end
end
