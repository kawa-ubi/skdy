class AddReferenceToTodos < ActiveRecord::Migration
  def change
    change_table :todos do |t|
      t.belongs_to :user, null: false
    end
  end
end
