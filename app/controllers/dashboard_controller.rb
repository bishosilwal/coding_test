class DashboardController < ApplicationController
  def index
    @person = Person.new
    flash.now[:notice] = "Person was successfully created."
  end
end
