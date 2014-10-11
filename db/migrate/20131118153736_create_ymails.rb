class CreateYmails < ActiveRecord::Migration
  def change
    create_table :ymails do |t|
      t.string :name,      :limit => 32
      t.timestamps
    end
  end

end
