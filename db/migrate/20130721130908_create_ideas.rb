class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name,      :limit => 32
      t.text :description, :limit => 4000
      t.string :picture
      t.integer :comments_count, :default => 0

      t.timestamps
      t.integer :lock_version, :default => 0
    end
    add_index :ideas, :name, unique: true
  end
end
