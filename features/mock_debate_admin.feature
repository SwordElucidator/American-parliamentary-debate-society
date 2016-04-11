Feature: Mock Debate Page
 
  As an administritor
  I want to manage the mock debates
  So that I can initiate new mock debate
  
  Background: users database is exist as follows
    Given the following users exist:
    | email   | password |
    | abc@efg.com    | asdfghjk        |
  
  Scenario: administritor on mockDebate page
  Given I am on the mockDebate page
  Then I should see "you should log in"
  And I should have field "username"
  And I should have field "password"
  And I fill in "username" with "abc@efg.com"
  And I fill in "password" with "asdfghjk"
  And I press "sign in"
  Then I should see "hello admin"
  
  Scenario: administritor want to add new mock debate
  Given I am on the mockDebate page
  And I fill in "username" with "abc@efg.com"
  And I fill in "password" with "asdfghjk"
  And I press "sign in"
  Then I should have button "add new debate"
  And I press "add new debate"
  Then I should be on addNewDebate page
  
  Scenario: administritor add new mock debate
  Given I am on the addNewDebate page
  Then I should have field "topic"
  And I should have field "time"
  And I should have button "create"
  And I fill in "topic" with "Is UC Berkeley always better than Stanford?"
  And I fill in "time" with "1/1/2050 13:25:00"
  Then I press "create"
  Then I should be on the mockDebate page
  And I should see "Is UC Berkeley always better than Stanford?"
  