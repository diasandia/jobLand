class Jobs < ActiveRecord::Migration[5.1]
  def change
  	create_table :jobs do |t|
  		t.string :company
  		t.string :job_title
  		t.string :url
  		t.string :description

      t.timestamps
  	end
  end
end
