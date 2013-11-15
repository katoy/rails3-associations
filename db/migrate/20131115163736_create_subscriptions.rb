class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :attendee, polymorphic: true
      t.belongs_to :part2
    end
  end

end
