class PersonalDataController < ApplicationController
  def index
  end

  def new
    render turbo_stream: turbo_stream.update(:person_modal, partial: "personal_data/data_modal")
  end

  def create
    @personal_data = PersonalData.new(personal_data_params)

    @personal_data.save
    render turbo_stream: [
      turbo_stream.update(:modalforms, partial: "employers/listing"),
      turbo_stream.update(:person_listing, partial: "personal_data/listing")
    ]
  end

  private

  def personal_data_params
    params.require(:personal_data).permit(:first_name, :last_name, :nickname, :email, :phone)
  end
end
