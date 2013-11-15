class CreateXassemblies < ActiveRecord::Migration
  def change
    create_table :xassemblies do |t|
      t.string :name,      :limit => 32
      t.timestamps
    end
  end

end
