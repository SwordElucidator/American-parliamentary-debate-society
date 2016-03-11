Feature: check that the sign in functionality works properly
 
  As an debate community member holding a website account
  So that I can sign in my website to see info, forum and events
  I want to see the sign in functionality behaves correctly

Background: accounts and data have been added to database
  
  account A, password A, datalist A
  account B, password B, datalist B
  account C, password C, datalist C

  And I am on the APDS home page

Scenario: now I am person A and I plan to log in
  When I am on the APDS home page
  Then I should see the "SignIn" button
  When I click on the "SignIn" button
  Then I should be on the "signin" page
  And I should see "account name"
  And I should see "password"
  And I should see "submit" button

Scenario: now I want to log in
  When I fill in "account name" field "nameA"
  And I fill in "password" field "passwordA"
  And I click on the "submit" button
  Then I should be on the APDS home page
  And I should see "nameA"