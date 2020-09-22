require 'rails_helper'

RSpec.describe PetAdoption, type: :model do
  describe "Validations" do
    context "should have valid adoption" do
      before do
        pet = create(:pet)
        subject.adopted_by = Faker::Name.first_name
        subject.adopted_at = rand(10).months.ago
        subject.pet = pet
      end

      it "Valid Adoption" do
        expect(subject).to be_valid
      end
    end
  end
  
end
