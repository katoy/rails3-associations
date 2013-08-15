class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :writer, index: true, null: false, :limit => 32
      t.references :idea, index: true, null: false

      t.timestamps
      t.integer:lock_version, :default => 0
    end
  end
end
