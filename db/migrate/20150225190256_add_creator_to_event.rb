class AddCreatorToEvent < ActiveRecord::Migration
  def change
    add_column :events, :creator_id, :integer
  end
end
