class HomeController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
    
  def index
    # Stores the saved updates
    if params[:status] == "Save"
      c = Content.create(:heading_title => params[:heading_title],
                     :heading_content => params[:heading_content],
                     :about_title => params[:about_title],
                     :about_content => params[:about_content],
                     :announcements_heading => params[:announcements_heading],
                     :announcements_content => params[:announcements_content])
    end
    
    # Pulls information from the database and displays them in the webpage
    content = Content.last
    
    if content != nil
      @content = content
      
      @about_content = Array.new
      paragraphs = content[:about_content].split("\n")
      paragraphs.each do |par|
        @about_content.push(par)
      end
  
      @announcements_content = Array.new
      paragraphs = content[:announcements_content].split("\n")
      paragraphs.each do |par|
        @announcements_content.push(par)
      end
    
    else  #Temporary placeholders, should probably seed later
      @content = Content.create(:heading_title => "Debate",
                     :about_title => "About",
                     :about_content => "About Content",
                     :announcements_heading => "Announcements",
                     :announcements_content => "Announcements Content")
      @about_content = Array.new
      @about_content.push(@content[:about_content])
      @announcements_content = Array.new
      @announcements_content.push(@content[:announcements_content])
    end
  end

  def edit
    # Pulls information from the database and displays them in the edit page
    @content = Content.last
  end
end