class Phases < ActiveRecord::Migration[5.1]
  def change
    create_table :phases do |t|
      t.string :phase_name
      t.string :next_steps

      t.timestamps
    end
  end
end
