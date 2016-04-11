class CommentsController < ApplicationController
    def create
        @section = Section.find(params[:section_id])
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:comment))
        @comment.user_id = current_user.id if current_user
        if @comment.save
            redirect_to section_post_path(@section, @post)
        else
            render 'new'
        end
    end
    
    def destroy
        @section = Section.find(params[:section_id])
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to section_post_path(@section, @post)
    end
    
    def edit
        @section = Section.find(params[:section_id])
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end
    
    def update
        @section = Section.find(params[:section_id])
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        
        if @comment.update(params[:comment].permit(:comment))
            redirect_to section_post_path(@section, @post)
        else
            render 'edit'
        end
    end
end
