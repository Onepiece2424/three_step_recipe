class RemovecolumnToRole < ActiveRecord::Migration[6.1]
  def change
    def up
      remove_column :authority_name, :string
      remove_column :created_at, :updated_at, :datetime
    end
  end
end
