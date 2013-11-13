class CreateAssemblies < ActiveRecord::Migration
  def change
    create_table :assemblies do |t|
      t.string :name,      :limit => 32
      t.timestamps
    end
  end

end
