class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :classname
      t.text :comment

      t.references :professor, index: true

      t.timestamps
    end
  end
end
