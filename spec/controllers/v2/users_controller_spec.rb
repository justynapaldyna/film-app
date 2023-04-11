require 'rails_helper'

RSpec.describe V2::UsersController, type: :controller do 

    describe 'GET #index' do 
        let!(:users) { create_list( :user, 10) } 
        subject { get :index }

        before { subject }

        it { expect(response.status).to eq(200) }

        it 'shows all users' do 
            expect(JSON.parse(response.body)['data'].map { |obj| obj['id'].to_i}).to eq(User.all.ids)
        end
    end
end