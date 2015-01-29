class CreateClashes < ActiveRecord::Migration
  def change
    create_table :clashes do |t|
      t.integer :winner
      t.integer :runner_up
      t.integer :fool
      t.belongs_to :game
      t.timestamps
    end
  end
end
