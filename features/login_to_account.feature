Feature: Login to the user account
 
  As a member of the American parliamentary debate society
  So that I can get access to the forum edit my frofile and signup for the open debate by signing in
  I want to be able to sign in to my account
  
  Background: users database is exist as follows
    Given the following users exist:
    | username   | password |
    | Aladdin    | G        |
    | Terminator | R        |
    | WHMS       | R        |
    | The0Help   | PG-13    |

  Scenario: I'm an unregistered user on the login page, but I want to signup
    Given I am on the login page
    Then I should have field "email"
    And I should have field "password"
    And I should have button "Sign In"
    When I follow "Sign Up"
    Then I should be on the signup page
    
  Scenario: I'm an unregistered user on the login page, and I try to hack around
    Given I am on the login page
    When I fill in "myUsername" with "Terminator"
    And I fill in "myPassword" with "Gaga"
    And I press "signin"
    Then I should not be on the "Terminator" user page

  Scenario: I'm an registered user on the login page, and I want to login
    Given I am on the login page
    When I fill in "Email" with "The0Help"
    And I fill in "Password" with "PG-13"
    And I press "Sign In"
    Then I should be on the home page of the website

  Scenario: I'm an unregistered user on the signup page, and I do want to signup, so that I can login
    Given I am on the signup page
    Then I should have field "Email"
    And I should have field "Password"
    And I should have field "Password confirmation"
    And I should have button "Sign Up"
    When I fill in "Email" with "abcde@fg.com"
    And I fill in "Password" with "12345"
    And I press "Sign Up"
    Then I should be on the home page of the website

  
  Scenario: However, I decided to use strange name to sign up our test the extreme of the website
    Given I am on the signup page
    And I press "submit"
    Then I should not be on the login page
    Given I am on the signup page
    When I fill in "myUsername" with "G*(&F*(TF&OTR#Goqy  efhw"
    And I fill in "myPassword" with "gotohell"    
    And I press "submit"
    Then I should not be on the login page
    