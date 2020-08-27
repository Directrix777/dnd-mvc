class AddAlignment < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :alignment, :string
  end
end
