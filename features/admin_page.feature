Feature: Admin Page
 
  As an administritor
  So that I can edit contents of anouncemnet or other things
  
  Scenario: admin page visit
  Given I am on the admin page of the website
  Then I should see "login"
  And I should not see "welcome"
  And I should have "username" field
  And I should have "password" field
  
  Scenario: login as admin
  Given I am on the admin page of the website
  When I fill in "username" with "superuser"
  And I fill in "password" with "superpass"
  Then I should see "welcome"
  
  Scenario: wrong admin login
  Given I am on the admin page of the website
  When I fill in "username" with "bobthehacker"
  And I fill in "password" with "letmein"
  Then I should on the home page