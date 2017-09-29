class JobSteps < ActiveRecord::Migration[5.1]
  def change
  	create_table :job_steps do |t|
  		t.references :job
  		t.references :step
  		t.boolean :complete

  		t.timestamps
  	end
  end
end
