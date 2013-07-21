class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :writer
      t.references :idea, index: true, null: false

      t.timestamps
    end
  end
end
