require 'rails_helper'

RSpec.describe PetsController do
  describe "List pets" do
    before do
      create_list(:pet, 10)
      get root_path
    end
    
    it "assigns @pets" do
      expect(assigns(:pets).count).to eql(10)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    context 'filters' do
      before do
        create(:pet, name: 'abc-petdog', date_of_birth: '2020-01-01'.to_date, pet_type: "dog")
        create(:pet, name: 'abc-petcat', date_of_birth: '2020-01-02'.to_date, pet_type: "cat")
        create(:pet, name: 'abc-other', date_of_birth: '2020-01-02'.to_date, pet_type: "cat")
      end
      
      context "filter by pet name" do
        it "assigns with name filter with cat" do
          get root_path, params: {filter: {name: 'petcat'}}
          expect(assigns(:pets).count).to eql(1)
        end

        it "assigns with name filter with dog" do
          get root_path, params: {filter: {name: 'petdog'}}
          expect(assigns(:pets).count).to eql(1)
        end

        it "assigns with name filter with pet" do
          get root_path, params: {filter: {name: 'abc'}}
          expect(assigns(:pets).count).to eql(3)
        end

        it "assigns with name filter with invalid name" do
          get root_path, params: {filter: {name: 'invalid'}}
          expect(assigns(:pets).count).to eql(0)
        end
      end

      context "filter by pet date of birth" do
        it "assigns with date of birth filter with first date" do
          get root_path, params: {filter: {"date_of_birth(1i)" => '2020', "date_of_birth(2i)" => '01', "date_of_birth(3i)" => '01'}}
          expect(assigns(:pets).count).to eql(1)
        end

        it "assigns with date of birth filter with second date" do
          get root_path, params: {filter: {"date_of_birth(1i)" => '2020', "date_of_birth(2i)" => '01', "date_of_birth(3i)" => '02'}}
          expect(assigns(:pets).count).to eql(2)
        end

        it "assigns with date of birth filter with invalid date" do
          get root_path, params: {filter: {"date_of_birth(1i)" => '2019', "date_of_birth(2i)" => '01', "date_of_birth(3i)" => '02'}}
          expect(assigns(:pets).count).to eql(0)
        end
      end

      context "filter by pet type" do
        it "assigns with pet type filter with dog" do
          get root_path, params: {filter: {pet_type: 0}}
          expect(assigns(:pets).count).to eql(11)
        end

        it "assigns with pet type filter with cat" do
          get root_path, params: {filter: {pet_type: 1}}
          expect(assigns(:pets).count).to eql(2)
        end
      end
    end
  end

  describe "Create Pet" do
    context "render new action" do
      before do
        get new_pet_path
      end

      it "assigns @pet" do
        expect(assigns(:pet)).not_to be nil
      end
    end
  end
end