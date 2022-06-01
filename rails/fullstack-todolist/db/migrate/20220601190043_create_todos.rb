class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :model
      t.boolean :completed

      t.timestamps
    end
  end
end
