class AddApprovedToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :approved, :boolean
  end
end
