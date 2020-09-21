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
    
    context "Should have invalid Adoption" do
      before do
        subject.valid?
      end

      it "Invalid Adoption" do
        expect(subject).to be_invalid
      end
      it { expect(subject.errors[:adopted_at]).not_to be_empty }
      it { expect(subject.errors[:adopted_at]).not_to be_empty }
      it { expect(subject.errors[:adopted_at].count).to eql(2) }
      it { expect(subject.errors[:pet]).not_to be_empty }
    end
  end
  
end
