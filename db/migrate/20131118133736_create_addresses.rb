class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :kind,  :limit => 4  # 'from', 'to', 'cc', 'bcc'
      t.string :val,   :limit => 256
      t.timestamps
    end
  end
end
