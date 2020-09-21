class FixPetTypeField < ActiveRecord::Migration[6.0]
  def up
    change_column :pets, :pet_type, :integer, default: 0, using: 'pet_type::integer'
  end

  def down 
    change_column :pets, :pet_type, :string, default: nil
  end
end
