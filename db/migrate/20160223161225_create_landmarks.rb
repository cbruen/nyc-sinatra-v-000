class CreateLandmarks < ActiveRecord::Migration
  def up
  	create_table :landmarks do |t|
  		t.string :name
  		t.string :year_completed
  		t.integer :figure_id
  	end
  end
  def down
  	drop_table :landmarks
  end
end
