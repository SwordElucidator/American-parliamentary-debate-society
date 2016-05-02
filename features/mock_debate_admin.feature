Feature: Mock Debate Page
 
  As an administritor
  I want to manage the mock debates
  So that I can initiate new mock debate
  
  Background: users database is exist as follows
    Given the following contents exist:
    |  heading_title |  heading_content |about_title |about_content |announcements_heading |announcements_content |
    | a        |b|c|d|e|f|
    Given the following invitation codes exist:
    |                    code                        |
    |     d3942dce589a8baf879be01b717184712b119a72   |
    Given the following users exist:
    |      email           |    password    |    password_confirmation  |              code                          |  firstname | lastname | is_admin |
    |   admin@admin.com    |    asdfghjk    |    asdfghjk               |  d3942dce589a8baf879be01b717184712b119a72  |   Hao      |  God     | true     |
    Given the following debates exist:
    |     topic      |     time     |  id  |  location  |
    | HaoShenZuiDiao |   04/30/2017 12:00 AM     |  1   |   earth    |
    Given the following slots exist:
    |  debate_id   |     slottype    |   time    |   user_id   |  status  |   id   |
    |      1       |    government   |  04/30/2017 12:00 AM  |     nil     |   empty  |   1    |
    |      1       |    government   |  04/30/2017 12:00 AM |     nil     |   empty  |   2    |
    |      1       |     opponent    |  04/30/2017 12:00 AM  |     nil     |   empty  |   3    |
    |      1       |     opponent    |  04/30/2017 12:00 AM  |     nil     |   empty  |   4    |
    |      1       |      judge      |  04/30/2017 12:00 AM |     nil     |   empty  |   5    |  
    |      1       |      judge      |  04/30/2017 12:00 AM |     nil     |   empty  |   6    |

  Scenario: administritor on mockDebate page
  Given I am on the mockDebate page
  #Then I should see "you should log in"
  And I should have field "email"
  And I should have field "password"
  When I fill in "user_email" with "admin@admin.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I click the link with name "Mock Debate"
  Then I should see "APDS Mock Debate Signups"
  
  Scenario: administritor want to add new mock debate, but not enter info correctly
  Given I am on the mockDebate page
  And I fill in "user_email" with "admin@admin.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I go to the create mock debate page
  And I press "submit"
  
  Scenario: administritor want to add new mock debate and enter info correctly
  Given I am on the mockDebate page
  And I fill in "user_email" with "admin@admin.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I go to the create mock debate page
  And I fill in "topic" with "Is Gengis the greatest General in the history?"
  And I fill in "time" with "1/1/2050 13:25:00"
  And I fill in "location" with "ground"
  And I press "submit"
  Then I should be on the mockDebate page
  
  Scenario: administritor update an existing debate
  Given I am on the mockDebate page
  And I fill in "user_email" with "admin@admin.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I go to the update mock debate page
  And I fill in "topic" with "Is UC Berkeley always better than Stanford?"
  And I fill in "time" with "1/1/2050 13:25:00"
  And I fill in "location" with "ground"
  Then I press "Update"
  Then I should see "Is UC Berkeley always better than Stanford?"
  Then I go to the mockDebate page
  And I should see "Register"
  And I click the link with name "Register"
  #Then I should have link "Cancel"
  
  Scenario: administritor deleting debate
  Given I am on the mockDebate page
  And I fill in "user_email" with "admin@admin.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I go to the update mock debate page
  And I follow "Delete"
  Then I should be on the mockDebate page
  And I should not see "HaoShenZuiDiao"
  