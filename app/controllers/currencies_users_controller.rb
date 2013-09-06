class CurrenciesUsersController < ApplicationController
  def create
    current_user.collect_currencies(params[:currency_ids])
    @currencies = Currency.includes(:country => [:countries_users])
    respond_to do |format|
    	format.js
    end
  end
end