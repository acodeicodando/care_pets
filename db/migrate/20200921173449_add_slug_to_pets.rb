class AddSlugToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :slug, :string, uniq: true
  end
end
