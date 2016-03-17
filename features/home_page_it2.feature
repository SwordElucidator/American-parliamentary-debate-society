Feature: Home Page
 
  As a admin of APDS website
  So that I can see improvement on the landing page
  I want to be able to see anouncements and pictures in the page
  
  Scenario: see anouncements
  Given I am on the home page of the website
  When I follow "anouncements"
  Then I should be on the "anouncements" section
  And I should see "anouncement texts"
  
  Scenario: click on "Join Us"
  Given I am on the home page of the website
  When I follow "Join Us"
  Then I should be on the join us page