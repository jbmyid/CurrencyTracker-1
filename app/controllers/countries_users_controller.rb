class CountriesUsersController < ApplicationController
  def create
    current_user.country_ids = params[:country_ids] 
    redirect_to countries_path, notice: "Countries visited successfully."
  end
end