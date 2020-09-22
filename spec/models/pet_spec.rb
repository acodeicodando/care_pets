require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe "Validations" do
    context "should have valid pet" do
      before do
        subject.name = Faker::Name.first_name
        subject.date_of_birth = rand(10).years.ago
        subject.pet_type = ["dog", "cat", "others"].sample
      end

      it "Valid Pet" do
        expect(subject).to be_valid
      end
    end
    
    context "Should have invalid pet" do
      before do
        subject.valid?
      end

      it "Invalid Pet" do
        expect(subject).to be_invalid
      end
      it { expect(subject.errors[:name]).not_to be_empty }
      it { expect(subject.errors[:date_of_birth]).not_to be_empty }
      it { expect(subject.errors[:date_of_birth].count).to eql(2) }
      it { expect(subject.errors[:pet_type]).to be_empty }
    end
  end

  describe "Case of Pet Adoption" do
    context "remove pet apdoption when adoted by is empty" do
      before do
        pet_adoption = create(:pet_adoption, adopted_by: "")
        subject = pet_adoption.pet
        subject.save
      end
      it { expect(subject.pet_adoption).to  be_nil} 
    end
  end
  
  
end
