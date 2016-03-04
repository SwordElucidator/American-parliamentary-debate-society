Feature: Home Page
 
  As a visitor of any kind
  So that I can access the contents posted by the admins
  I want to view the contents of the landing page
  
  Scenario: click on "About Us"
  Given I am on the home page of the website
  When I click on "About Us"
  Then I should be redirected to the "About Us" section
  
  Scenario: click on "Culture"
  Given I am on the home page of the website
  When I click on "Culture"
  Then I should be redirected to the "Culture" section
  
  Scenario: click on "Join Us"
  Given I am on the home page of the website
  When I click on "Join Us"
  Then I should be redirected to the "Join Us" page