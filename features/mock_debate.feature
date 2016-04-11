Feature: Mock Debate Page
 
  As an user
  I want to join the mock debates
  So that I can enter and leave mock debate
  
  Background: users database is exist as follows
    Given the following users exist:
    | id  |      email       |    password    |
    |  1  |   abc@efg.com    |    asdfghjk    |
    Given the following debates exist:
    |     topic      |     time     |  id  |  location  |
    | HaoShenZuiDiao |   forever    |  1   |   earth    |
    Given the following slots exist:
    |  debate_id   |     slottype    |  status   |   time    |   user_id   |
    |      1       |    government   |  forever  |  forever  |     nil     |
    |      1       |    government   |  forever  |  forever  |     nil     |
    |      1       |     opponent    |  forever  |  forever  |     nil     |
    |      1       |     opponent    |  forever  |  forever  |     nil     |
    |      1       |      judge      |  forever  |  forever  |     nil     |
    |      1       |      judge      |  forever  |  forever  |     nil     |
  
  Scenario: user on mockDebate page
  Given I am on the mockDebate page
  Then I should see "you should log in"
  And I should have field "email"
  And I should have field "password"
  When I fill in "user_email" with "abc@efg.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  Given I am on the mockDebate page
  Then I should see "abc@efg.com"
  And I should see "Debate"
  
  Scenario: user want to join new mock debate
  Given I am on the mockDebate page
  When I fill in "user_email" with "abc@efg.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  When I go to the mockDebate page
  Then I should have button "register"
  And I press "HaoShenZuiDiao_1"
  Then I should see "abc@efg.com"
  
  Scenario: user want to leave the mock debate
  Given I am on the mockDebate page
  When I fill in "user_email" with "abc@efg.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I press "join government"
  And I should have button "leave"
  And I press "leave"
  Then I should see "empty"
  
