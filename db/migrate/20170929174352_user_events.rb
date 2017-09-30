class UserEvents < ActiveRecord::Migration[5.1]
  def change
  	create_table :user_events do |t|
  		t.references :user
      t.references :networking_events
      t.references :attendable, polymorphic: true, null: false

  		t.timestamps
  	end
  end
end
