class CreateAddressings < ActiveRecord::Migration
  def change
    create_table :addressings do |t|
      t.belongs_to :adr, polymorphic: true
      t.belongs_to :addrsess
    end
  end

end
