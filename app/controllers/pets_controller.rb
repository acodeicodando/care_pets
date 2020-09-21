class PetsController < ApplicationController
  def index
    @pets = Pet.paginate(page: params[:page], per_page: 10).order(:name)
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
end
