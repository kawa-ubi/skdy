class CreateUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name

      t.timestamps
    end
  end
end
