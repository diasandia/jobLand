class CreateRubrics < ActiveRecord::Migration[5.1]
  def change
    create_table :rubrics do |t|
      t.string :standard_one
      t.string :standard_two
      t.string :standard_three
      t.references :user

      t.timestamps
    end
  end
end
