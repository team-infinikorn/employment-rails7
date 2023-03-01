require 'rails_helper'

RSpec.describe EmployersController, type: :controller do
  describe "#create" do
    context "when personal data exists" do
      let!(:personal_datum) do
        PersonalDatum.create(
          email: FFaker::Internet.email,
          first_name: FFaker::Name.first_name,
          last_name: FFaker::Name.last_name,
          nickname: FFaker::Name.first_name,
          phone: '123-345-1231'
        )
      end
      context "with valid params" do
        let(:valid_params) do
          { 
            employer: 
            {
              employer: FFaker::Company.name,
              date_started: Time.now,
              date_employment_ended: Time.now + 1.week
            }
          }
        end
    
        it "creates a new employer" do
          expect {
            post :create, params: valid_params
          }.to change { Employer.count }.by(1)
        end
    
        it "assigns the new employer to @employer" do
          post :create, params: valid_params
          expect(assigns(:employer)).to be_a(Employer)
          expect(assigns(:employer)).to be_persisted
        end
    
        it "renders the employer_section partial" do
          post :create, params: valid_params
          expect(response).to have_http_status(:ok)
          expect(response).to render_template(partial: 'employers/_listing')
        end
      end
    
      context "with invalid params" do
        let(:invalid_params) do
          { 
            employer: 
            {
              employer: nil,
              date_started: Time.now,
              date_employment_ended: Time.now + 1.week
            }
          }
        end
    
        it "does not create a new employer" do
          expect {
            post :create, params: invalid_params
          }.not_to change { Employer.count }
        end
      end
    end
  end
end
