require 'rails_helper'

RSpec.describe Employer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:employer) }
    it { should validate_presence_of(:date_started) }
    it { should validate_presence_of(:date_employment_ended) }
  end

  describe 'associations' do
    it { should belong_to(:personal_datum) }
  end
end
