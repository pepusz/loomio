class RenameEventUserToActor < ActiveRecord::Migration
  def change
    rename_column :events, :user_id, :actor_id
  end
end
