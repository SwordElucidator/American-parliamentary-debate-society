Feature: Delete old debates

    As an admin, I expect the old debates won't appear 
    in the mock debate so that the user won't be able to see it 
    and register for it.
    
    Background: database is exist as follows
        Given the following debates exist:
        | topic   | location     | datetimepicker1time  |
        | Interesting    | Berkeley       | 04/06/2016 12:00 AM  |
    
    Scenario: users cannot see outdated debates
    Given I am an user 
    And I am on the mockdebate page of the website
    Then I should not see debate "Interesting"
    And I should not see datetime "04/06/2016 12:00 AM"
    
    Scenario: admin can't create old debates
    Given I am an admin
    And I am on the create mockdebate page of the website
    When I fill in "topic" with "Berkeley VS MIT"
    And I fill in "location" with "Evans 10"
    And I fill in "datetimepicker1time" with "04/06/2016 12:00 AM"
    And I press "Create Debate"
    Then I should be able to see the flash message "You cannot create outdated debates"