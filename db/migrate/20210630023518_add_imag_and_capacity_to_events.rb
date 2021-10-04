class AddImagAndCapacityToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :image_file_name, :string
    add_column :events, :capacity, :integer
  end
end
