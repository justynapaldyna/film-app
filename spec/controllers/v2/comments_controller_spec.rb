require 'rails_helper'

RSpec.describe V2::CommentsController, type: :controller do

    describe 'GET #index' do 
    
        let!(:comments) { create_list(:comment, 10) } 
        subject { get :index }

        before { subject }

        it { expect(response.status).to eq(200) }

        it 'shows all comments' do 
            expect(JSON.parse(response.body)['data'].map { |obj| obj['id'].to_i }).to eq(Comment.all.ids)
        end

            
    end
end