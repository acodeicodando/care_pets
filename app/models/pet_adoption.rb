class PetAdoption < ApplicationRecord
  belongs_to :pet
  validates :adopted_by, :adopted_at, presence: true
  validates_associated :pet

  validate :valid_adopted_at?

  private

  def valid_adopted_at?
    if !adopted_at.is_a?(Date)
      errors.add(:adopted_at, 'must be a valid date of adoption') 
    end
  end
end
