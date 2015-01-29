class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :leader
      t.belongs_to :group
      t.timestamps
    end
  end
end
