class PersonalDataController < ApplicationController
  def index
  end

  def create
    @personal_data = PersonalData.new(personal_data_params)

    @personal_data.save
  end

  private

  def personal_data_params
    params.require(:personal_data).permit(:first_name, :last_name, :nickname, :email, :phone)
  end
end
