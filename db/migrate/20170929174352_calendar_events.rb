class CalendarEvents < ActiveRecord::Migration[5.1]
  def change
  	create_table CalendarEvents do |t|
  		t.string :title
  		t.string :description
      t.datetime :datetime
  		t.string :location
  		t.references :user
      t.references :attendable, polymorphic: true, null: false

  		t.timestamps
  	end
  end
end
