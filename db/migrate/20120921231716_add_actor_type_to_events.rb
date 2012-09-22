class AddActorTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :actor_type, :string
  end
end
