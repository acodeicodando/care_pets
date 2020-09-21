class PetsController < ApplicationController
  def index
    @pets = Pet.paginate(page: params[:page], per_page: 10).order(:name)
  end
end
