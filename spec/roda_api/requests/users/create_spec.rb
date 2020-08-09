# frozen_string_literal: true

RSpec.describe 'Users', type: :request do
  describe 'POST #create' do
    before { post('/users/create', params) }

    describe 'Success' do
      let(:params) { { email: 'some@email.com' } }

      it 'renders new user' do
        expect(response).to be_created
        expect(resource_type(response)).to eq('user')
        expect(response).to match_json_schema('user')
      end
    end

    describe 'Failure' do
      let(:params) { {} }

      it 'renders errors' do
        expect(response).to be_unprocessable
        expect(response).to match_json_schema('error')
      end
    end
  end
end
