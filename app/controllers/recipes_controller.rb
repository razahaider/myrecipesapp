class RecipesController < ApplicationController
    
    def index
        @recipes = Recipe.all
    end
    
    def show
        binding.pry
    end

end
