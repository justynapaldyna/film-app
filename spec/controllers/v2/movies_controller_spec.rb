require 'rails_helper'

RSpec.describe V2::MoviesController, type: :controller do 

    describe 'GET #index' do 
        let!(:movies) { create_list( :movie, 10) } 
        subject { get :index }

        before { subject }

        it { expect(response.status).to eq(200) }

        it 'shows all movies' do 
            expect(JSON.parse(response.body)['data'].map { |obj| obj['id'].to_i}).to eq(Movie.all.ids)
        end
    end
end