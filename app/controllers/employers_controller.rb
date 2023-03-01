class EmployersController < ApplicationController
  def index; end

  def new
    render turbo_stream: turbo_stream.append(:employements, partial: 'employers/form')
  end

  def create
    @employer = PersonalDatum.last.employers.new(employer_params)

    @employer.save

    render turbo_stream: turbo_stream.update(:employer_section, partial: 'employers/listing')
  end

  private

  def employer_params
    params.require(:employer).permit(:employer, :date_started, :date_employment_ended)
  end
end
