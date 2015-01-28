class CreateClashes < ActiveRecord::Migration
  def change
    create_table :clashes do |t|
      t.string :winner
      t.string :runner_up
      t.string :fool
      t.belongs_to :game
      t.timestamps
    end
  end
end
