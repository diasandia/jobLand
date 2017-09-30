class UserJobs < ActiveRecord::Migration[5.1]
  def change
  	create_table :user_jobs do |t|
  		t.references :job
  		t.references :user
  		t.integer :criteria_one_score
      t.integer :criteria_two_score
      t.integer :criteria_three_score

  		t.timestamps
  	end
  end
end
