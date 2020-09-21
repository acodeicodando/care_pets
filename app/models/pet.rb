class Pet < ApplicationRecord
  enum pet_type: [ :dog, :cat, :others ]
  validates :name, :date_of_birth, :pet_type, presence: true
  validate :valid_birthday?

  private

  def valid_birthday?
    if !date_of_birth.is_a?(Date)
      errors.add(:date_of_birth, 'must be a valid date') 
    end
  end
end
