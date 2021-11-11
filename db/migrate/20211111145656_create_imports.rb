class CreateImports < ActiveRecord::Migration[6.1]
  def change
    create_table :imports do |t|
      t.string :file
      t.string :model_class_name

      t.timestamps
    end
  end
end
