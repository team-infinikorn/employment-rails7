class EmployersController < ApplicationController
  def new
    @employer = Employer.new

    render turbo_stream: turbo_stream.update(:person_modal, partial: 'employers/data_modal' )
  end

  def create
    if @personal_data.present?
      @employer = @personal_data.employers.new(employer_params)
      @employer.save
    else
      @employer = Employer.new(employer_params)
      @employer.errors.add(:base, "please create personal data first")
    end

    render turbo_stream: turbo_stream.update(:employer_section, partial: 'employers/listing')
  end

  private

  def employer_params
    params.require(:employer).permit(:employer, :date_started, :date_employment_ended)
  end
end
