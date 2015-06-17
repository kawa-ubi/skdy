class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :amount

      t.references :cart, index: true
      t.references :menu, index: true

      t.timestamps
    end
  end
end
