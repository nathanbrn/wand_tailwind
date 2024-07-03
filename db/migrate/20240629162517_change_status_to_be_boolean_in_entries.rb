class ChangeStatusToBeBooleanInEntries < ActiveRecord::Migration[5.2]
  def change
    change_column_default :entries, :status, from: nil, to: false
  end
end
