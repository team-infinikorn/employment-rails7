class EmployersController < ApplicationController
  def create
    if PersonalDatum.last.present?
      @employer = PersonalDatum.last.employers.new(employer_params)

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
