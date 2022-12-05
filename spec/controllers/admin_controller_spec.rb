require 'rails_helper'

RSpec.describe AdminController, type: :controller do

    describe 'users method' do
      subject { get :index }

      it 'shows all the users' do
        subject
        expect(assigns(:users).to_a).to eq(User.all.to_a)
      end
    end

    describe 'movies method' do
        subject { get :index }
  
        it 'shows all the movies' do
          subject
          expect(assigns(:movies).to_a).to eq(Movie.all.to_a)
        end
    end

    describe 'show user method' do
        let!(:user) { create(:user) }
        subject { get :show_user, params: { id: user.id } }

        it 'assigns proper user object' do
            subject
            expect(assigns(:user)).to eq(user)
        end
    end

    describe 'edit user method' do
        let!(:user) { create(:user) }
        subject { get :edit_user, params: { id: user.id } }

        it 'assigns proper user object' do
            subject
            expect(assigns(:user)).to eq(user)
        end
    end

    describe 'PUT #update' do
        let!(:user) { create(:user) }
        subject { put :update_user, params: params }

        context 'valid params' do
            let(:params) { { id: user.id, user: { login: 'Gal A' } } }
    
            it 'updates user' do
              expect{ subject }.to change{ user.reload.login }.to('Gal A')
            end
        end
    end
end