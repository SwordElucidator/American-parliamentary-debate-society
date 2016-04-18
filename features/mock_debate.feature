Feature: Mock Debate Page
 
  As an user
  I want to join the mock debates
  So that I can enter and leave mock debate
  
  Background: users database is exist as follows
    Given the following contents exist:
    |  heading_title |  heading_content |about_title |about_content |announcements_heading |announcements_content |
    | a        |b|c|d|e|f|
    Given the following invitation codes exist:
    |                    code                        |
    |     4ee9d9155f5a7d3ecdadcbea9b9bf4b9fa5f14f8   |
    Given the following users exist:
    |      email       |    password    |    password_confirmation  |              code                          |  firstname | lastname |
    |   abc@efg.com    |    asdfghjk    |    asdfghjk               |  4ee9d9155f5a7d3ecdadcbea9b9bf4b9fa5f14f8  |   Han      |  God     |
    Given the following debates exist:
    |     topic      |     time     |  id  |  location  |
    | HaoShenZuiDiao |   forever    |  1   |   earth    |
    Given the following slots exist:
    |  debate_id   |     slottype    |  status   |   time    |   user_id   |  status  |   id   |
    |      1       |    government   |  forever  |  forever  |     nil     |   empty  |   1    |
    |      1       |    government   |  forever  |  forever  |     nil     |   empty  |   2    |
    |      1       |     opponent    |  forever  |  forever  |     nil     |   empty  |   3    |
    |      1       |     opponent    |  forever  |  forever  |     nil     |   empty  |   4    |
    |      1       |      judge      |  forever  |  forever  |     nil     |   empty  |   5    |  
    |      1       |      judge      |  forever  |  forever  |     nil     |   empty  |   6    |
  
  Scenario: user on mockDebate page
  Given I am on the mockDebate page
  Then I should see "you should log in"
  And I should have field "email"
  And I should have field "password"
  When I fill in "user_email" with "abc@efg.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I follow "Mock Debate"
  Then I should see "APDS Mockup Debate Signups"
  
  Scenario: user want to join or leave new mock debate
  Given I am on the mockDebate page
  When I fill in "user_email" with "abc@efg.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I follow "Mock Debate"
  And I click the link with name "Register"
  Then I should have link "Cancel"
  And I click the link with name "Cancel"
  
  Scenario: user can not play two role in one debate (sad path)
  Given I am on the mockDebate page
  When I fill in "user_email" with "abc@efg.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I follow "Mock Debate"
  And I click the link with name "Register"
  Then I should have link "Cancel"
  When I click another "Register"
  And I click the link with name "Cancel"
  Then I should not see "Cancel"
  
