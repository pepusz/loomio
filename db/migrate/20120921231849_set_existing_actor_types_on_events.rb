class SetExistingActorTypesOnEvents < ActiveRecord::Migration
  def up
    execute "UPDATE events SET actor_type = 'User' WHERE actor_id IS NOT NULL"
  end

  def down
    execute "UPDATE events SET actor_type = NULL"
  end
end
