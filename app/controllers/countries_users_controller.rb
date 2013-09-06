class CountriesUsersController < ApplicationController
  def create
    current_user.country_ids = params[:country_ids] 
    @countries = Country.includes(:countries_users)
    respond_to do |format|
    	format.js
    end
  end
end