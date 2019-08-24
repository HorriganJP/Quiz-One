class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :task
      t.text :description
      t.integer :due

      t.timestamps
    end
  end
end
