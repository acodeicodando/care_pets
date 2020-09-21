class CreatePetAdoptions < ActiveRecord::Migration[6.0]
  def change
    create_table :pet_adoptions do |t|
      t.references :pet, null: false, foreign_key: true
      t.string :adopted_by
      t.date :adopted_at

      t.timestamps
    end
  end
end
