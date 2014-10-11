class CreateXmails < ActiveRecord::Migration
  def change
    create_table :xmails do |t|
      t.string :name,      :limit => 32
      t.timestamps
    end
  end

end
