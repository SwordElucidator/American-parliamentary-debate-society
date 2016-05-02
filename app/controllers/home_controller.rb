class HomeController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
    
  def index
    # Stores the saved updates
    content = Content.last
    @content = content
    data = params[:content]
    if data
      content.heading_title = data[:heading_title]
      content.heading_content = data[:heading_content]
      content.about_title = data[:about_title]
      content.about_content = data[:about_content]
      content.announcements_heading = data[:announcements_heading]
      content.announcements_content = data[:announcements_content]
      content.heading_image1 = data[:heading_image1]
      content.heading_image2 = data[:heading_image2]
      content.heading_image3 = data[:heading_image3]
      content.heading_image4 = data[:heading_image4]
      content.leader_name1 = data[:leader_name1]
      content.leader_name2 = data[:leader_name2]
      content.leader_name3 = data[:leader_name3]
      content.leader_name4 = data[:leader_name4]
      content.leader_name5 = data[:leader_name5]
      content.leader_name6 = data[:leader_name6]
      content.leader_sub1 = data[:leader_sub1]
      content.leader_sub2 = data[:leader_sub2]
      content.leader_sub3 = data[:leader_sub3]
      content.leader_sub4 = data[:leader_sub4]
      content.leader_sub5 = data[:leader_sub5]
      content.leader_sub6 = data[:leader_sub6]
      content.leader_image1 = data[:leader_image1]
      content.leader_image2 = data[:leader_image2]
      content.leader_image3 = data[:leader_image3]
      content.leader_image4 = data[:leader_image4]
      content.leader_image5 = data[:leader_image5]
      content.leader_image6 = data[:leader_image6]
      content.save()
    end
    
    # Pulls information from the database and displays them in the webpage
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