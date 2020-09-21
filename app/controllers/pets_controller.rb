class PetsController < ApplicationController
  before_action :set_new_pet, only: [:new, :create]
  before_action :set_pet, only: [:show, :edit, :update]

  def index
    @pets = Pet.paginate(page: params[:page], per_page: 10).order('LOWER(name)')
    unless params[:filter].blank?
      filters = params[:filter]

      date_of_birth = nil
      begin
        date_of_birth = Date.civil(
          filters["date_of_birth(1i)"].to_i,
          filters["date_of_birth(2i)"].to_i,
          filters["date_of_birth(3i)"].to_i
        )
      rescue
        date_of_birth = nil
      end

      @pets = @pets.where("name ilike ?", "%#{filters[:name]}%") unless filters[:name].blank?
      @pets = @pets.where(date_of_birth: date_of_birth) unless date_of_birth.nil?
      @pets = @pets.where(pet_type: filters[:pet_type]) unless filters[:pet_type].blank?
    end
  end

  def new
  end

  def create
    @pet.attributes = pet_params
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pet.update_attributes(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def show
  end

  protected
    def set_new_pet
      @pet = Pet.new
    end

    def set_pet
      @pet = Pet.friendly.find(params[:id])
      @pet.build_pet_adoption if @pet.pet_adoption.nil?
    end

    def pet_params
      params.require(:pet).permit(
        :name, :date_of_birth, :pet_type,
        pet_adoption_attributes: [:id, :adopted_by, :adopted_at]
      )
    end
end
