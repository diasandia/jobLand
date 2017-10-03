class CreateRubrics < ActiveRecord::Migration[5.1]
  def change
    create_table :rubrics do |t|
      t.string :standard_one, default: "Experienced Manager"
      t.string :standard_two, default: "Location"
      t.string :standard_three, default: "Diversity & Inclusion"
      t.references :user

      t.timestamps
    end
  end
end
