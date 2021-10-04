class AddFieldsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :description, :text
    add_column :events, :start_at, :datetime
  end
end
