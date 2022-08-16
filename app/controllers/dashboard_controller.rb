class DashboardController < ApplicationController
  def index
    @person = Person.new
    @employment = Employment.new
  end

  def person_employment
    @employments = Employment.all
  end
end
