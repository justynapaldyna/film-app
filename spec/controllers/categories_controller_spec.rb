require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

    describe 'GET #index' do
      subject { get :index }

      it 'shows all the categories' do
        subject
        expect(assigns(:categories).to_a).to eq(Category.all.to_a)
      end
    end

    describe 'POST #create' do
        let(:user) { create(:user) }
        subject { post :create, params: params }

        context 'valid params' do
            let(:params) { { movie: { name: 'Costume drama' } } }
            it 'creates category' do
                expect{ subject }.to change{ Category.count }.by(1)
            end
        end

        context 'invalid params' do
            let(:params) { { movie: { name: nil } } }
            it 'does not create category' do
                expect{ subject }.not_to change{ Category.count }
            end

            it 'renders new' do
                expect(subject).to render_template(:new)
            end
        end
    end

    describe 'GET #new' do
        subject { get :new }
        it 'initializes empty category' do
            subject
            expect(assigns(:category).attributes).to eq(Category.new.attributes)
        end
    end

    describe 'GET #edit' do
        let!(:category) { create(:category) }
        subject { get :edit , params: { id: category.id } }

        it 'assigns proper category object' do 
            subject 
            expect(assigns(:category)).to eq(movie)
        end
    end

    describe 'GET #show' do
        let!(:category) { create(:category) }
        subject { get :show, params: { id: category.id } }

        it 'assigns proper category object' do
            subject
            expect(assigns(:category)).to eq(category)
        end
    end

    describe 'PUT #update' do
        let!(:category) { create(:category) }
        subject { put :update, params: params }

        context 'valid params ' do
            let(:params) { { id: category.id, category: { name: 'New drama' } } }
            it 'updates category' do
                expect{ subject }.to change{ category.reload.name }.to('New drama')
            end
        end

        context 'invalid params' do
            let(:params) { { id: category.id, category: { name: nil }}}

            it 'does not update the category' do
                expect{ subject }.not_to change{ category.reload.name }
            end
        end
    end

    describe 'DELETE #destroy' do
        let!(:category) { create(:category )}
        subject { delete :destroy, params: { id: category.id } }

        it 'destroys category' do
            expect{ subject }.to change{ Category.count }.by(-1)
        end

        it 'redirects properly' do
            expect(subject).to redirect_to(categories_path)
        end
    end
end
