class AddBrochuretypeToBrochures < ActiveRecord::Migration[5.1]
  def change
    add_column :brochures, :brochuretype, :string
  end
end
