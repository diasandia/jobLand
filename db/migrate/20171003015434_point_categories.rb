class PointCategories < ActiveRecord::Migration[5.1]
  def change
  	create_table :point_categories do |t|
  		t.string :category
  		t.integer :number_of_points
 
  		t.timestamps 
 	 end
  end
end
