class CreateStandards < ActiveRecord::Migration[5.1]
  def change
    create_table :standards do |t|
      t.string :standard_one, default: "Standard One"
      t.string :standard_two, default: "Standard Two"
      t.string :standard_three, default: "Standard Three"
      t.references :user

      t.timestamps
    end
  end
end
