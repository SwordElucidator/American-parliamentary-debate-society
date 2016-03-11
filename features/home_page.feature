Feature: Home Page
 
  As a visitor of any kind
  So that I can access the contents posted by the admins
  I want to view the contents of the landing page
  
  Scenario: click on "About"
  Given I am on the home page of the website
  When I follow "About"
  Then I should be on the "About Us" section
  
  Scenario: click on "Culture"
  Given I am on the home page of the website
  When I follow "Culture"
  Then I should be on the "Culture" section
  
  Scenario: click on "Join Us"
  Given I am on the home page of the website
  When I follow "Join Us"
  Then I should be on the "Join Us" page