class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :attendable, polymorphic: true, null: false
      t.datetime :datetime
      t.string :title
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
