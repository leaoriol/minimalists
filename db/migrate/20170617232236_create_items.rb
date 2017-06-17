class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.string :action
      t.integer :list_id

      t.timestamps
    end
  end
end
