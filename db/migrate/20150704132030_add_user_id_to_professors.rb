class AddUserIdToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :user_id, :integer
  end
end
