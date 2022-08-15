class DashboardController < ApplicationController
  def index
    @person = Person.new
  end
end
