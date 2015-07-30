class AddCellphoneToPeople < ActiveRecord::Migration
  def change
    add_column :people, :cellphone, :string
  end
end
