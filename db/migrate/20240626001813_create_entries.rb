class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :description
      t.decimal :amount
      t.string :category
      t.string :status
      t.string :tag
      t.string :entry_type

      t.timestamps
    end
  end
end
