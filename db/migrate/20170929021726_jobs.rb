class Jobs < ActiveRecord::Migration[5.1]
  def change
  	create_table :jobs do |t|
  		t.string :company
  		t.string :job_title
  		t.string :url
  		t.string :description
      t.references :user
      t.references :job
      t.integer :criteria_one_score
      t.integer :criteria_two_score
      t.integer :criteria_three_score
      t.string :current_phase

      t.timestamps
  	end
  end
end
