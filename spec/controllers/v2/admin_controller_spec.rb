require 'rails_helper'

RSpec.describe V2::AdminController, type: :controller do

    describe 'GET users method' do
      let!(:users) { create_list(:user, 10) }

      subject { get :users } 

      before { subject }

      it { expect(response.status).to eq(200) }

      it 'shows all the users' do
        expect(JSON.parse(response.body)['data'].map { |obj| obj['id'].to_i }).to eq(User.all.ids)
      end

      context 'when data is invalid' do
        
        subject { get :users, params: { id: -1 } }

        it { expect(response.status).to eq(400) }
      end

        
    end
end
