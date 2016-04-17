class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @section = Section.find(params[:section_id])
        @posts = @section.posts.order("created_at DESC")
    end
    
    def show
        #@post = Post.find(params[:id])
        @section = Section.find(params[:section_id])
    end
    
    def new
        @section = Section.find(params[:section_id])
        @post = current_user.posts.build
    end
    
    
    def create
        @section = Section.find(params[:section_id])
        @post = current_user.posts.build(post_params)
        @post.section = @section
        if @post.save
            redirect_to section_post_path(@section, @post)
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        @section = Section.find(params[:section_id])
        if @post.update(post_params)
            redirect_to section_post_path(@section, @post)
        else
            render 'edit'
        end
    end
    
    def destroy
        @section = Section.find(params[:section_id])
        @post.destroy
        redirect_to section_posts_path(@section)
    end
    
    private
    
    def find_post
        @section = Section.find(params[:section_id])
        @post = Post.find(params[:id])
    end
    
    def post_params
        params.require(:post).permit(:title, :content)
    end
end
