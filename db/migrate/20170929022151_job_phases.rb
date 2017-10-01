class JobPhases < ActiveRecord::Migration[5.1]
  def change
  	create_table :job_phases do |t|
      t.references :user_job
  		t.references :phase
  		t.boolean :complete, default: false

  		t.timestamps
  	end
  end
end
