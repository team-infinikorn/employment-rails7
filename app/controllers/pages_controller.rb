class PagesController < ApplicationController
  def index
    @personal_data = PersonalData.new
  end
end
