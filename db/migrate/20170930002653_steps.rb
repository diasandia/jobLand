class Steps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :step_text
      t.string :phase_name

      t.timestamps
    end
  end
end
