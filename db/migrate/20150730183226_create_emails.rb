class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
      t.boolean :main, default: false
      t.references :person, foreign_key: true, index: true

      t.timestamps
    end
  end
end
