class ApplicationController < ActionController::Base
  before_action :set_personal_data

  def set_personal_data
    @personal_data = PersonalDatum.last
  end
end
