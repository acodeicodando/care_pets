class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :date_of_birth
      t.string :pet_type

      t.timestamps
    end
  end
end
