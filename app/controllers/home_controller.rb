class HomeController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
    
  def index
    # Stores the saved updates
    if params[:status] == "Save"
      Content.create(:heading_title => params[:heading_title],
                     :heading_content => params[:heading_content],
                     :about_title => params[:about_title],
                     :about_content => params[:about_content],
                     :announcements_heading => params[:announcements_heading],
                     :announcements_content => params[:announcements_content])
    end
    
    # Pulls information from the database and displays them in the webpage
    content = Content.last
    
    @heading_title = content[:heading_title]
    
    @about_title = content[:about_title]
    @about_content = Array.new
    paragraphs = content[:about_content].split("\n")
    paragraphs.each do |par|
      @about_content.push(par)
    end

    @announcements_heading = content[:announcements_heading]
    @announcements_content = Array.new
    paragraphs = content[:announcements_content].split("\n")
    paragraphs.each do |par|
      @announcements_content.push(par)
    end
  end

  def edit
    # Pulls information from the database and displays them in the webpage
    content = Content.last
    
    @heading_title = content[:heading_title]
    @about_title = content[:about_title]
    @about_content = content[:about_content]
    @announcements_heading = content[:announcements_heading]
    @announcements_content = content[:announcements_content]
  end
end