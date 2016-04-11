Feature: Mock Debate Page
 
  As an user
  I want to join the mock debates
  So that I can enter and leave mock debate
  
  Background: users database is exist as follows
    Given the following users exist:
    | email   | password |
    | abc@efg.com    | asdfghjk        |

    Given the following contents exist
    | heading_title | heading_content | heading_image_url | about_title | about_content | announcements_heading | announcements_content |
    | default       | default         | default           | default     | default       | default               | default               |
    
    # Given the following debates exist:
    # | topic   | time |  id  |
    # | HaoShenZuiDiao    |   forever      |  1 |
    # Given the following slots exist:
    # | debate_id   |   type   |   time  | user_id |
    # |   1  |    government   |  forever |  nil|
    # |   1  |    government   |  forever |  nil|
    # |   1  |    opponent   |  forever |    nil|
    # |   1  |    opponent   |  forever |    nil|
    # |   1  |    judge   |  forever |       nil|
    # |   1  |    judge   |  forever |       nil|
  
  Scenario: user on mockDebate page
  Given I am on the mockDebate page
  Then I should see "you should log in"
  And I should have field "email"
  And I should have field "password"
  And I fill in "email" with "abc@efg.com"
  And I fill in "password" with "asdfghjk"
  And I press "sign in"
  Then I should see "hello user"
  
  Scenario: user want to join new mock debate
  Given I am on the mockDebate page
  And I fill in "email" with "abc@efg.com"
  And I fill in "password" with "asdfghjk"
  And I press "sign in"
  Then I should see "HaoShenZuiDiao"
  Then I should have button "join government"
  And I should have button "join opponent"
  And I should have button "join judges"
  And I press "join government"
  Then I should see "abc@efg.com"
  
  Scenario: user want to leave the mock debate
  Given I am on the mockDebate page
  And I fill in "email" with "abc@efg.com"
  And I fill in "password" with "asdfghjk"
  And I press "sign in"
  And I press "join government"
  And I should have button "leave"
  And I press "leave"
  Then I should see "empty"
  