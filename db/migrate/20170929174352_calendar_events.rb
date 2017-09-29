class CalendarEvents < ActiveRecord::Migration[5.1]
  def change
  	create_table CalendarEvents do |t|
  		t.string :title 
  		t.string :description 
  		t.string :location 
  		t.references :attendable, polymorphic: true
  		t.references :user

  		t.timestamps
  	end
  end
end
