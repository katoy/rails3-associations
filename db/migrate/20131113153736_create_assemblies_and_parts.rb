class CreateAssembliesAndParts < ActiveRecord::Migration
  def change
    create_table :assemblies_parts do |t|
      t.belongs_to :assembly
      t.belongs_to :part
    end
  end

end
