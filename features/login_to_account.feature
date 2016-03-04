Feature: Login to the user account
 
  As a member of the American parliamentary debate society
  So that I can get access to the forum edit my frofile and signup for the open debate by signing in
  I want to be able to sign in to my account
  
  Scenario: click sigin to go to the login page
  Given I am on the home page of the website
  When I click on signin
  Then I should be redirected to the signin page
  And I should see username 
  And I should see password
  And I should see username field
  And I should see password field
  And I should see sigin button
  And I should see signup button
  
  
  Scenario: fill in the form correctly to signin
  Given I am on the signin page of the website
  When I fill in the form with username:testusername
  #Then I should see the username is correct (If we decide to use AJAX, then consider of adding this)
  And I fill in the form with password:testpassword
  #Then I should see the password matches the username (If we decide to use AJAX, then consider of adding this)
  And I press Sign In button
  Then I should be redirected to the homepage
  And I should see Hello, testusername
  And I should see Edit Profile
  And I should see Forum
  And I should see Signup Debate
  
  Scenario: fill in the form incorrectly
  Given I am on the signin page of the website
  When I fill in the form with username:incorrecttestusername 
  #Then I should see the username is incorrect (If we decide to use AJAX, then consider of adding this)
  And I fill in the form with password:incorrectpassword
  #Then I should see the password is incorrect (If we decide to use AJAX, then consider of adding this)
  And I press Sign In button
  Then I should see the username doesn't exist or the password doesn't match the username
  
  Scenario: go to the signup page of the website
  Given I am on the signin page of the website
  When I click on Sign Up button
  Then I should be redirected to the signup page
  
  