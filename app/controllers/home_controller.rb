class HomeController < ApplicationController
    
  def index
    
    # by SE(Hao)
    # TODO I just use the current No.1 content from contents so it might be better to record and use the last later?...
    # right now you may just save what you want to save into the "Content.find(1)" if we only need to change.
    content = Content.find(1)
    
    @heading_title = content[:heading_title]
    
    @about_title = content[:about_title]
    @about_content = Array.new
    cnts = content[:about_content].split("\n")
    i = 0
    for cnt in cnts do
      @about_content[i] = cnt
      i = i + 1
    end
    
    # @about_heading = params[:about_heading]
    # @about_content = params[:about_content]

    @announcements_heading = content[:announcements_heading]
    @announcements_content = Array.new
    cnts = content[:announcements_content].split("\n")
    i = 0
    for cnt in cnts do
      @announcements_content[i] = cnt
      i = i + 1
    end
    # @announcements_heading = params[:announcements_heading]
    # @announcements_content = params[:announcements_content]

  end

  def edit
    # be able to change the text, images, and colors
  end
     
end