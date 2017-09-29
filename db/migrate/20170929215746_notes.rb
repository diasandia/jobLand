class Notes < ActiveRecord::Migration[5.1]
  def change
  	create_table :notes do |t|
  		t.string :description 
  		t.references :notable, polymorphic: true

  		t.timestamps
  	end
  end
end
