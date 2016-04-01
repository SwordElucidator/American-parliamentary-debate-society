Feature: Admin Page
 
  As an administritor
  So that I can edit contents of anouncemnet or other things
  
  Scenario: admin page visit
  Given I am on the admin page
  Then I should see "Dashboard"
  And I should see "Comments"
  And I should see "Posts"
  And I should see "Users"