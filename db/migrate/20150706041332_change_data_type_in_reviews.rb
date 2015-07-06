class ChangeDataTypeInReviews < ActiveRecord::Migration
  def change
  	change_column :reviews, :rating, :decimal, :precision => 5, :scale => 2
  end
end

