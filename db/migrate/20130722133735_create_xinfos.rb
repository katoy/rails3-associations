class CreateXinfos < ActiveRecord::Migration
  def change
    create_table :xinfos do |t|
      t.string :writer, index: true, null: false
      t.references :idea, index: true, null: false

      t.timestamps
    end
  end
end
