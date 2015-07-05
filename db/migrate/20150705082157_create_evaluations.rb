class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :rating
      t.string :class
      t.text :comment

      t.timestamps
    end
  end
end
