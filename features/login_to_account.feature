Feature: Login to the user account
 
  As a member of the American parliamentary debate society
  So that I can get access to the forum edit my frofile and signup for the open debate by signing in
  I want to be able to sign in to my account
  
  Background: users database is exist as follows
    Given the following users exist:
    | email   | password |
    | abc@efg.com    | asdfghjk        |


  Scenario: I'm an unregistered user on the login page, but I want to signup
    Given I am on the login page
    Then I should have field "user_email"
    And I should have field "user_password"
    And I should have button "Sign In"
    When I follow "Sign Up"
    Then I should be on the signup page
    
  Scenario: I'm an unregistered user on the login page, and I try to hack around
    Given I am on the login page
    When I fill in "user_email" with "Terminator"
    And I fill in "user_password" with "Gaga123"
    And I press "Sign In"
    Then I should not be on the "Terminator" user page

  Scenario: I'm an registered user on the login page, and I want to login
    Given I am on the login page
    When I fill in "user_email" with "abc@efg.com"
    And I fill in "user_password" with "asdfghjk"
    And I press "Sign In"
    Then I should be on the home page of the website

  Scenario: I'm an unregistered user on the signup page, and I do want to signup, so that I can login
    Given I am on the signup page
    Then I should have field "user_email"
    And I should have field "user_password"
    And I should have field "user_password_confirmation"
    And I should have button "Sign Up"
    When I fill in "user_email" with "abcde@fg.com"
    And I fill in "user_password" with "123456789"
    And I fill in "user_password_confirmation" with "123456789"
    And I press "Sign Up"
    Then I should be on the home page of the website

  
  Scenario: However, I decided to use strange name to sign up our test the extreme of the website
    Given I am on the signup page
    And I press "Sign Up"
    Then I should not be on the login page
    Given I am on the signup page
    When I fill in "user_email" with "G*(&F*(TF&OTR#Goqy  efhw"
    And I fill in "user_password" with "gotohell"    
    And I press "Sign Up"
    Then I should not be on the login page
    