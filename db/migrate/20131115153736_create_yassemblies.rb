class CreateYassemblies < ActiveRecord::Migration
  def change
    create_table :yassemblies do |t|
      t.string :name,      :limit => 32
      t.timestamps
    end
  end

end
