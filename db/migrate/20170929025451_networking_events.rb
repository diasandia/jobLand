class NetworkingEvents < ActiveRecord::Migration[5.1]
  def change
  	create_table :networking_events do |t|
  		t.string :url

  		t.timestamps 
  	end
  end
end
