class AddTitlesToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :title, :string
  end
end
