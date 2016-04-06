class HomeController < ApplicationController
    
  def index
    
    # Stores the saved updates
    if params[:status] == "Saved"
      Content.create(:heading_title => params[:heading_title],
                     :heading_content => params[:heading_content],
                     :about_title => params[:about_heading],
                     :about_content => params[:about_content],
                     :announcements_heading => params[:announcements_heading],
                     :announcements_content => params[:announcements_content])
    end

    # Pulls information from the database and displays them in the webpage
    content = Content.last
    
    @heading_title = content[:heading_title]
    
    @about_title = content[:about_title]
    @about_content = Array.new
    cnts = content[:about_content].split("\n")
    i = 0
    for cnt in cnts do
      @about_content[i] = cnt
      i = i + 1
    end

    @announcements_heading = content[:announcements_heading]
    @announcements_content = Array.new
    cnts = content[:announcements_content].split("\n")
    i = 0
    for cnt in cnts do
      @announcements_content[i] = cnt
      i = i + 1
    end

  end

  def edit
    # be able to change the text, images, and colors
  end
     
end