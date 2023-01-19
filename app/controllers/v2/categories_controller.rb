class V2::CategoriesController < ApplicationController
    def index 
        categories = Category.all 
        render json: categories
    end
end