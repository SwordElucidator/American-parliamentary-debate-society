Feature: Editing the home page as an admin
 
    As an admin of APDS website
    So that I can edit the website dynamically
    I want to edit the website without knowing how to code

    Scenario: Admin can edit the about title
        Given I am on the edit home page
        And I type "James is God" in "About Title"
        And I click "Save"
        Then I should be on the home page
        And I should see "James is God"

    Scenario: Admin can edit the about content
        Given I am on the edit home page
        And I type "Admin is writing things" in "About Content"
        And I click "Save"
        Then I should be on the home page
        And I should see "Admin is writing things"

    Scenario: Admin can edit the about title and content at the same time
        Given I am on the edit home page
        And I type "Here is the change in about title" in "About Title"
        And I type "Here is the change in about content" in "About Content"
        And I click "Save"
        Then I should be on the home page
        And I should see "Here is the change in about title"
        And I should see "Here is the change in about content"

    Scenario: Admin can edit the announcements title
        Given I am on the edit home page
        And I type "James is God" in "Announcements Title"
        And I click "Save"
        Then I should be on the home page
        And I should see "James is God"

    Scenario: Admin can edit the announcements content
        Given I am on the edit home page
        And I type "Admin is writing things" in "Announcements Content"
        And I click "Save"
        Then I should be on the home page
        And I should see "Admin is writing things"

    Scenario: Admin can edit the about title and view changes when editing the home page
        Given I am on the edit home page
        And I type "James is God" in "About Title"
        And I click "Save"
        Then I should be on the home page
        And I should see "James is God"
        Then I go to the edit home page
        And I should see "James is God"

    Scenario: Incorrect method of editing the about title
        Given I am on the edit home page
        And I type "James is God" in "About Title"
        And I go to the home page
        Then I should not see "James is God"


    # Scenario: Admin can edit the about image

