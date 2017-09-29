class UserPoints < ActiveRecord::Migration[5.1]
  def change
  	create_table :user_points do |t|
  		t.references :user
  		t.references :point_categories

  		t.timestamps
  	end
  end
end
