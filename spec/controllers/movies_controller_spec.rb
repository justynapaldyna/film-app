require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

    describe 'GET #index' do
        subject { get :index }

        it 'shows all the movies' do
        subject
        expect(assigns(:movies).to_a).to eq(Movie.all.to_a)
        end
    end

  describe 'POST #create' do 
    let(:user) { create(:user) }
    subject { post :create, params: params }

    context 'when user is not authorized' do
      context 'valid params' do
        let(:params) { { movie: { title: 'Movie title', year: '2022', description: 'Lorem Ipsum', movie_length: '1h0m', director: 'Mr Director', language: 'English', rating: 'PG-13', user: user, category: category } } }

        it 'creates movie' do
          expect{ subject }.to change{ Movie.count }.by(0)
        end
      end
    end

    context 'when user is authorized' do
      before { sign_in user }

      context 'valid params' do 
        let(:params) { { movie: { title: 'Movie title', year: '2022', description: 'Lorem Ipsum', movie_length: '1h0m', director: 'Mr Director', language: 'English', rating: 'PG-13', user: user, category: category } } }

        it 'creates movie' do
          expect{ subject }.to change{ Movie.count }.by(1)
        end

        it 'redirects properly' do
          expect(subject).to redirect_to(movies_path)
        end
      end

      context 'invalid params' do
        let(:params) { { movie: { title: nil, year: '2022', description: 'Lorem Ipsum', movie_length: '1h0m', director: 'Mr Director', language: 'English', rating: 'PG-13', user: user, category: category } } }

        it 'doesnt create movie' do
          expect{ subject }.not_to change{ Movie.count }
        end

        it 'renders new' do
          expect(subject).to render_template(:new)
        end
      end
    end
  end

  describe 'GET #new' do
    subject { get :new }

    it 'initializes empty movie' do
      subject
      expect(assigns(:movie).attributes).to eq(Movie.new.attributes)
    end
  end

  describe 'GET #edit' do
    let!(:movie) { create(:movie) }
    subject { get :edit, params: { id: movie.id } }

    it 'assigns proper movie object' do
      subject
      expect(assigns(:movie)).to eq(movie)
    end
  end

  describe 'GET #show' do
    let!(:movie) { create(:movie) }
    subject { get :show, params: { id: movie.id } }

    it 'assigns proper movie object' do
      subject
      expect(assigns(:movie)).to eq(movie)
    end
  end

  describe 'PUT #update' do
    let!(:movie) { create(:movie) }
    subject { put :update, params: params }

    context 'valid params' do
      let(:params) { { id: movie.id, movie: { title: 'New Title' } } }

      it 'updates movie' do
        expect{ subject }.to change{ movie.reload.title }.to('New title')
      end
    end

    context 'invalid params' do
      let(:params) { { id: movie.id, movie: { title: nil } } }

      it 'doesnt update movie' do
        expect{ subject }.not_to change{ movie.reload.title }
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:movie) { create(:movie) }
    subject { delete :destroy, params: { id: movie.id } }

    it 'destroys movie' do
      expect{ subject }.to change{ Movie.count }.by(-1)
    end

    it 'redirects properly' do
      expect(subject).to redirect_to(movies_path)
    end
  end
end