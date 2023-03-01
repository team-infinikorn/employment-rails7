require 'rails_helper'

RSpec.describe PersonalDatum, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_most(25) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_most(50) }
    it { should validate_presence_of(:email) }
    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
    it { should validate_presence_of(:phone) }
    it { should allow_value('123-456-7890').for(:phone) }
    it { should_not allow_value('invalid_phone').for(:phone) }
  end

  describe 'associations' do
    it { should have_many(:employers).dependent(:destroy) }
    it { should accept_nested_attributes_for(:employers) }
  end
end
