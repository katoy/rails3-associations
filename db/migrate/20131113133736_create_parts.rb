class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name,      :limit => 32
      t.timestamps
    end
  end
end
