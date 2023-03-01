RSpec.describe PersonalDataController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:valid_params) do
      {
        personal_datum: {
          first_name: 'John',
          last_name: 'Doe',
          email: 'john.doe@example.com',
          phone: '123-456-7890'
        }
      }
    end

    let(:invalid_params) do
      {
        personal_datum: {
          first_name: 'John',
          last_name: 'Doe',
          email: 'invalid_email',
          phone: '123'
        }
      }
    end

    context "with valid params" do
      it "creates a new PersonalDatum and renders the listing partials via turbo stream" do
        expect {
          post :create, params: valid_params
        }.to change(PersonalDatum, :count).by(1)

        expect(response.body).to include('turbo-stream')
      end
    end

    context "with invalid params" do
      it "does not create a new PersonalDatum and renders the data_modal partial via turbo stream" do
        expect {
          post :create, params: invalid_params
        }.to_not change(PersonalDatum, :count)

        expect(response.body).to include('turbo-stream')
      end
    end
  end

  describe "PATCH #update" do
    let(:personal_datum) do
      PersonalDatum.create(
        email: FFaker::Internet.email,
        first_name: FFaker::Name.first_name,
        last_name: FFaker::Name.last_name,
        nickname: FFaker::Name.first_name,
        phone: '123-345-1231'
      )
    end

    let(:valid_params) do
      {
        id: personal_datum.id,
        personal_datum: {
          first_name: 'Jane',
          last_name: 'Doe',
          email: 'jane.doe@example.com',
          phone: '123-456-7890'
        }
      }
    end

    let(:invalid_params) do
      {
        id: personal_datum.id,
        personal_datum: {
          first_name: '',
          last_name: '',
          email: 'invalid_email',
          phone: '123'
        }
      }
    end

    context "with valid params" do
      it "updates the PersonalDatum and renders the listing partials via turbo stream" do
        patch :update, params: valid_params

        personal_datum.reload
        expect(personal_datum.first_name).to eq('Jane')
        expect(personal_datum.last_name).to eq('Doe')
        expect(personal_datum.email).to eq('jane.doe@example.com')
        expect(personal_datum.phone).to eq('123-456-7890')

        expect(response.body).to include('turbo-stream')
      end
    end
  end
end
