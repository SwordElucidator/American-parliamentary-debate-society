Feature: Viewing the home page as a visitor
 
  As a visitor of any kind
  So that I can access the contents posted by the admins
  I want to view the contents of the landing page
  
  Scenario: click on "About"
  Given I am on the home page of the website
  When I follow "About"
  Then I should be on the "About Us" section
  
  Scenario: click on "Annnouncements"
  Given I am on the home page of the website
  When I follow "Announcements"
  Then I should be on the "Announcements" section

  Scenario: click on "Join Us"
  Given I am on the home page of the website
  When I follow "Join Us"
  Then I should be on the join us page