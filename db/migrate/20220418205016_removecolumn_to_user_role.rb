class RemovecolumnToUserRole < ActiveRecord::Migration[6.1]
  def change
    def up
      remove_column :user_id, :role_id, :integer
      remove_column :created_at, :updated_at, :datetime
    end
  end
end
