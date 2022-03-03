class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.text :process1
      t.text :process2
      t.text :process3

      t.timestamps
    end
  end
end
