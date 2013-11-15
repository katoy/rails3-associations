class CreatePart2s < ActiveRecord::Migration
  def change
    create_table :part2s do |t|
      t.string :name,      :limit => 32
      t.timestamps
    end
  end
end
