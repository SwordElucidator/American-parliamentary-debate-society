Feature: Delete old debates

    As an admin, I expect the old debates won't appear 
    in the mock debate so that the user won't be able to see it 
    and register for it.
  
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
    | Interesting |   04/3/2016 12:00 AM     |  1   |   earth    |

    Scenario: users cannot see outdated debates
  Given I am on the mockDebate page
  #Then I should see "you should log in"
  And I should have field "email"
  And I should have field "password"
  When I fill in "user_email" with "admin@admin.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I click the link with name "Mock Debate"
    #And I am on the mockdebate page of the website
    Then I should not see "Interesting"
    And I should not see "04/06/2016 12:00 AM"
    
    Scenario: admin can't create old debates
  Given I am on the mockDebate page
  #Then I should see "you should log in"
  And I should have field "email"
  And I should have field "password"
  When I fill in "user_email" with "admin@admin.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I click the link with name "Mock Debate"
  And I go to the create mock debate page
    When I fill in "topic" with "Berkeley VS MIT"
    And I fill in "location" with "Evans 10"
    And I fill in "time" with "04/06/2016 12:00 AM"
    And I press "Create"
    #Then I should see "You cannot create outdated debates"