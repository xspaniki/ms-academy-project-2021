class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :zipcode
      t.string :city
      t.references :user

      t.timestamps
    end
  end
end
