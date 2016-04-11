Feature: Edit user profile_controller
  
  As a member of the American parliamentary debate society
  So that I can update the information that shows up in my profile
  I want to be able to edit my profile
  
  Background: users database is exist as follows
    Given the following users exist:
    | email          | password  |
    | abc@efg.com    | asdfghjk  |
    
    Given the following contents exist
    | heading_title | heading_content | heading_image_url | about_title | about_content | announcements_heading | announcements_content |
    | default       | default         | default           | default     | default       | default               | default               |

    Given I am on the login page
    When I fill in "user_email" with "abc@efg.com"
    And I fill in "user_password" with "asdfghjk"
    And I press "Sign In"

  Scenario: Go to profile page
    Given I am on the profile page
    Then I should see "Welcome, abc@efg.com"
    And I should see "Edit Your Profile"

  Scenario: Update user information
    Given I am on the profile page
    And I fill in "user_firstname" with "Bob"
    And I fill in "user_lastname" with "God"
    And I fill in "user_major" with "Electrical Engineering and Computer Science"
    And I press "Update User"
    Then I should see "Welcome"
    Then I should see "Your email is abc@efg.com"
    Then I should see "Your current major is Electrical Engineering and Computer Science"