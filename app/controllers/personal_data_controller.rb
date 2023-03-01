class PersonalDataController < ApplicationController
  def index; end

  def new
    @personal_data = PersonalDatum.new

    render turbo_stream: turbo_stream.update(:person_modal, partial: 'personal_data/data_modal' )
  end

  def create
    @personal_data = PersonalDatum.new(personal_data_params)

    if @personal_data.save
      render turbo_stream: [
        turbo_stream.update(:modal_form_section, partial: 'employers/listing'),
        turbo_stream.update(:person_data_listing, partial: 'personal_data/listing')
      ]
    else
      render turbo_stream: turbo_stream.update(:person_modal, partial: 'personal_data/data_modal')
    end
  end

  def update
    @personal_data = PersonalDatum.find(params[:id])

    if @personal_data.update(personal_data_params)
      render turbo_stream: [
        turbo_stream.update(:modal_form_section, partial: 'employers/listing'),
        turbo_stream.update(:person_data_listing, partial: 'personal_data/listing')
      ]
    else
      render turbo_stream: turbo_stream.update(:person_modal, partial: 'personal_data/data_modal')
    end
  end

  private

  def personal_data_params
    params.require(:personal_datum).permit(:first_name, :last_name, :nickname, :email, :phone)
  end
end
