class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end
    
    def show
        @category = Category.find(params[:id])
    end
    
    def show_1_category
    end
    
    def show_2_category
    end

    def show_3_category
    end
    def show_4_category
    end
    def show_5_category
    end
    def show_6_category
    end
    def show_7_category
    end
    def show_8_category
    end
    def show_9_category
    end
    def show_10_category

    end
end
