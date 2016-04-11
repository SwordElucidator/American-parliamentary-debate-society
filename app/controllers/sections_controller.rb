class SectionsController < ApplicationController
    def index
        @sections = Section.all.order("title DESC")
    end
    
    def show
        @section = Section.find(params[:id])
        redirect_to section_posts_path(@section)
    end
end
