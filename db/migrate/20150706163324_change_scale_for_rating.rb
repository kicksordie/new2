class ChangeScaleForRating < ActiveRecord::Migration
  def change
  	change_column :reviews, :rating, :decimal, :precision => 5, :scale => 3
  end
end
