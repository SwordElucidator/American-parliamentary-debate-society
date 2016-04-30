Feature: Mock Debate Page
 
  As an user
  I want to cancel a mock debate
  So that I can leave mock debate
  
  Background: users database is exist as follows
    Given the following contents exist:
    |  heading_title |  heading_content |about_title |about_content |announcements_heading |announcements_content |
    | a        |b|c|d|e|f|
    Given the following invitation codes exist:
    |                    code                        |
    |     4ee9d9155f5a7d3ecdadcbea9b9bf4b9fa5f14f8   |
    Given the following users exist:
    |id|      email       |    password    |    password_confirmation  |              code                          |  firstname | lastname |
    |10| abc@efg.com    |    asdfghjk    |    asdfghjk               |  4ee9d9155f5a7d3ecdadcbea9b9bf4b9fa5f14f8  |   Han      |  God     |
    Given the following debates exist:
    |     topic      |     time     |  id  |  location  |
    | HaoShenZuiDiao |   04/30/2017 12:00 AM     |  1   |   earth    |
    Given the following slots exist:
    |  debate_id   |     slottype    |   time    |   user_id   |  status  |   id   |
    |      1       |    government   |  04/30/2017 12:00 AM  |    10     |   full  |   1    |
    |      1       |    government   |  04/30/2017 12:00 AM |     nil     |   empty  |   2    |
    |      1       |     opponent    |  04/30/2017 12:00 AM  |     nil     |   empty  |   3    |
    |      1       |     opponent    |  04/30/2017 12:00 AM  |     nil     |   empty  |   4    |
    |      1       |      judge      |  04/30/2017 12:00 AM |     nil     |   empty  |   5    |  
    |      1       |      judge      |  04/30/2017 12:00 AM |     nil     |   empty  |   6    |
  
  Scenario: user on mockDebate page want to cancel
  Given I am on the mockDebate page
  #Then I should see "you should log in"
  And I should have field "email"
  And I should have field "password"
  When I fill in "user_email" with "abc@efg.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I click the link with name "Mock Debate"
  And I click the link with name "Cancel"
  
    Scenario: user on mockDebate page want to register same debate:error
  Given I am on the mockDebate page
  #Then I should see "you should log in"
  And I should have field "email"
  And I should have field "password"
  When I fill in "user_email" with "abc@efg.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I click the link with name "Mock Debate"
  And I click the link with name "Register"