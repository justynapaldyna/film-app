require 'rails_helper'

RSpec.describe V2::AdminController, type: :controller do

    describe 'GET users method' do
      let!(:users) { create_list(:user, 10) }

      context 'when data is valid' do

        subject { get :users } 
        before { subject }

        it { expect(response.status).to eq(200) }

        it 'shows all the users' do
          expect(JSON.parse(response.body)['data'].map { |obj| obj['id'].to_i }).to eq(User.all.ids)
        end
        
      end

      context 'when data is invalid' do
        subject { get :users, params: {id: -1} }
        before { subject }

        it 'expect status to be 404' do
          expect(response.status).to eq(404)
        end
      end

        
    end

    describe 'show user method' do
      let!(:user) { create(:user) }
      

      context 'when data is valid' do
      
        subject { get :show_user, params: { id: user.id } }
        
        before { subject }

        it { expect(response.status).to eq(200) }

        it 'assigns proper object' do
          expect(JSON.parse(response.body)['data']['id']).to eq((user.id).to_s)
        end 
      end

      context 'when data is invalid' do
      
        subject { get :show_user, params: { id: -1 } }
        
        before { subject }
      
        it 'expect status to be 404' do
          expect(response.status).to eq(404)
        end
      end
    end

end
