class HomeController < ApplicationController
    
  def index
    @about_heading = "We're the Debate Society of Berkeley!"
    @about_content = Array.new
    @about_content[0] = "We compete in the American Parliamentary Debate Association (APDA) circuit, which has member schools nationwide, but is most prominent along the East Coast. We've travelled to tournaments at UChicago, Harvard, Stanford, Brown, and many more - we're also holding our own tournament this spring, in late February."
    @about_content[1] = "Networking is an important part of debate culture. Many debaters in this league go on to become lawyers from the top 14 schools, join well-reputed consulting firms, and run for political office. If you have any intention of pursuing those kinds of career paths, you'd feel right at home in APDA."
    @about_content[2] = "New debaters don't need to be focused on becoming lawyers or Senators to get the most out of our team though: honing public speaking ability, mastering the elements of grounded and coherent argumentation, and understanding how to pick apart even the strongest opposition, are useful skills for any career."
    @about_content[3] = "No prior debate experience is necessary! The style of the APDA circuit is similar to some styles of high school debate, but is different in some very crucial ways, so all new members will have a thing or two to learn."
  
    # @about_heading = params[:about_heading]
    # @about_content = params[:about_content]

    @announcements_heading = "Announcements"
    @announcements_content = Array.new
    @announcements_content[0] = "This is a sample announcement"
    # @announcements_heading = params[:announcements_heading]
    # @announcements_content = params[:announcements_content]

  end

  def edit
    # be able to change the text, images, and colors
  end
     
end