class EmploymentsController < ApplicationController

  def new
    @employment = Employment.new
  end

  def create
    @employment = Employment.new(employment_params)

    respond_to do |format|
      if @employment.save
        format.html { redirect_to person_employment_path, notice: "Employment was successfully created." }
        format.json { render :show, status: :created, location: @employment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def employment_params
      params.require(:employment).permit(:person_id, :date_started, :employment_date_ended)
    end
end
