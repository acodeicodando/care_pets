class PetAdoption < ApplicationRecord
  belongs_to :pet
  validates_associated :pet
end
