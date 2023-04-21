require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  before { sign_in user }

  describe 'users method' do
    
    let!(:user) { create(:user, status: 1) }
    subject { get :users }

    it 'shows all the users' do
       #binding.pry
      subject
      expect(assigns(:users).to_a).to eq(User.all.to_a)
    end
  end

  describe 'movies method' do
      let!(:user) { create(:user, status: 1) }
      subject { get :movies }

      it 'shows all the movies' do
        subject
        expect(assigns(:movies).to_a).to eq(Movie.all.to_a)
      end
  end

  describe 'show user method' do

    context 'when user is authorized' do
      let!(:user) { create(:user, status: 1) }
      subject { get :show_user, params: { id: user.id } }

      it 'assigns proper user object' do
          subject
          expect(assigns(:user)).to eq(user)
          expect(response.status).to eq(200)
      end
    end
    context 'when user is not authorized' do
      let!(:user) { create(:user) }
      subject { get :show_user, params: { id: user.id } }

      it 'assigns proper user object' do
          subject
          expect(response.status).to eq(302)
      end
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
      let!(:user) { create(:user, status: 1) }
      let!(:user_1) { create(:user) }
      subject { put :update_user, params: params }

      context 'on own profile' do
        let(:params) { { id: user.id, user: { login: 'Gal A' } } }

        it 'does not update user and redirects' do 
          expect{ subject }.not_to change{ user.reload.login } 
          expect(response).to redirect_to(admin_users_path)
        end
      end

      context 'valid params' do
          let(:params) { { id: user_1.id, user: { login: 'Gal A' } } }
  
          it 'updates user' do
            expect{ subject }.to change{ user_1.reload.login }.to('Gal A')
          end
      end
      context 'invalid params' do 
        let(:params) { { id: user_1.id, user: { login: nil } } }

        it 'does not update user' do 
          expect{ subject }.not_to change{ user_1.reload.login }
        end
      end
  end
end