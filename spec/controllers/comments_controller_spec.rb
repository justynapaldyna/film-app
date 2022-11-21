require 'rails_helper'

Rspec.describe CommentsController, type: :controller do

    describe 'GET #index' do
        subject { get :index }

        it 'shows all comments' do
            subject
            expect(assigns(:comments).to_a).to eq(Comment.all.to_a)
        end
    end

    describe 'POST #create' do
        let(:user) { create(:user) }
        let(:movie) { create(:movie) }
        subject { post :create, params: params }

        context 'when user is not authorized' do
            context 'valid params' do
                let(:params) { { comment: { body: 'Nice movie', user_id: user.id, movie_id: movie.id } } }
                it 'creates comment' do 
                    expect{ subject }.to change{ Comment.count }.by(0)
                end
            end
        end

        context 'when user is authorized' do 
            before { sign_in user }
            context 'valid params' do
                let(:params) { { comment: { body: 'Nice movie', user_id: user.id, movie_id: movie.id } } }
                it 'creates comment' do 
                    expect{ subject }.to change{ Comment.count }.by(1)
                end
            end
            context 'invalid params' do 
                let(:params) { { comment: { body: nil, user_id: user.id, movie_id: movie.id } } }
                it 'doesnt create comment' do 
                    expect{ subject }.not_to change{ Comment.count }
                end

                it 'renders new' do 
                    expect(subject).to render_template(:new)
                end
            end
        end
    end

    describe 'GET #new' do 
        subject { get :new }
        it 'initializes empty comment' do 
            subject
            expect(assigns(:comment).attributes).to eq(Comment.new.attributes)
        end
    end

    describe 'GET #edit' do 
        let!(:comment) { create(:comment)}
        subject { get :edit, params: { id: comment.id } }

        it 'assigns proper comment object' do 
            subject
            expect(asigns(:comment)).to eq(comment)
        end
    end

    describe 'GET #show' do 
        let!(:comment) { create(:comment) }
        subject { get :show, params: { id: comment.id } }

        it 'assigns proper comment object' do 
            subject
            expect(asigns(:comment)).to eq(comment)
        end
    end

    describe 'PUT #update' do 
        let!(:user) { create(:user) }
        let!(:movie) { create(:movie) }
        let!(:comment) { create(:comment) }
        subject { put :update, params: params }

        context 'when user is not authorized' do 

            context 'valid params' do 
                let(:params) { { id: comment.id, comment: { body: 'test comment'} } }

                it 'doesnt update comment' do 
                    expect{ subject }.not_to change.{ comment.reload.body }
                end
            end
        end

        context 'when user is authorized' do
            before { sign_in user }
            context 'valid params' do 
                let(:params) { { id: comment.id, comment: { body: 'test comment'} } }

                it 'updates comment' do 
                    expect{ subject }.to change{ comment.reload.body }.to('test comment')
                end
            end
            
            context 'invalid params' do 
                let(:params) { { id: comment.id, comment: { body: nil} } }

                it 'doesnt update comment' do 
                    expect{ subject }.not_to change{ comment.reload.body }
                end
            end
        end
    end

    describe 'DELETE #destroy' do 
        let!(:user) { create(:user) }
        let!(:movie) { create(:movie) }
        let!(:comment) { create(:comment) }
        subject { delete :destroy, params: { id: user.id } }

        context 'when user is not authorised' do
            it 'destroys comment' do
              expect{ subject }.to change{ Comment.count }.by(0)
            end
          end
      
          context 'when user is authorised' do
            before { sign_in user }
      
            it 'destroys user' do
              expect{ subject }.to change{ Comment.count }.by(-1)
            end
          end
      
          it 'redirects properly' do
            expect(subject).to redirect_to(movies_path)
          end
        end
            