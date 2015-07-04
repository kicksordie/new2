class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :name
      t.string :title
      t.string :department
      t.string :link

      t.timestamps
    end
  end
end
