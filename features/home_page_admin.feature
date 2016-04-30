Feature: Editing the home page as an admin
 
    As an admin of APDS website
    So that I can edit the website dynamically
    I want to edit the website without knowing how to code
    
    Background:
      Given the following contents exist
      | heading_title | heading_content | heading_image_url | about_title | about_content | announcements_heading | announcements_content |
      | default       | default         | default           | default     | default       | default               | default               |

    Scenario: Admin can edit the about title
        Given I am on the edit home page
        And I fill in "James is God" for "content_about_title"
        And I press "Update Content"
        Then I should be on the home page of the website
        And I should see "James is God"

    Scenario: Admin can edit the about content
        Given I am on the edit home page
        And I fill in "Admin is writing things" for "content_about_content"
        And I press "Update Content"
        Then I should be on the home page of the website
        And I should see "Admin is writing things"

    Scenario: Admin can edit the about title and content at the same time
        Given I am on the edit home page
        And I fill in "Here is the change in about title" for "content_about_title"
        And I fill in "Here is the change in about content" for "content_about_content"
        And I press "Update Content"
        Then I should be on the home page of the website
        And I should see "Here is the change in about title"
        And I should see "Here is the change in about content"

    Scenario: Admin can edit the announcements title
        Given I am on the edit home page
        And I fill in "James is God" for "content_announcements_heading"
        And I press "Update Content"
        Then I should be on the home page of the website
        And I should see "James is God"

    Scenario: Admin can edit the announcements content
        Given I am on the edit home page
        And I fill in "Admin is writing things" for "content_announcements_content"
        And I press "Update Content"
        Then I should be on the home page of the website
        And I should see "Admin is writing things"

    Scenario: Incorrect method of editing the about title
        Given I am on the edit home page
        And I fill in "James is God" for "content_about_title"
        And I go to the home page of the website
        Then I should not see "James is God"