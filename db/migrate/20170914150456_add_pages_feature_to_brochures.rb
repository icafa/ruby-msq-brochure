class AddPagesFeatureToBrochures < ActiveRecord::Migration[5.1]
  def change
    add_column :brochures, :current_page_number, :integer
    add_column :brochures, :page_count, :integer
  end
end
