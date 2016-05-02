Feature: Edit user profile_controller
  
  As a member of the American parliamentary debate society
  So that I can update the information that shows up in my profile
  I want to be able to edit my profile
  
  Background: users database is exist as follows
    
    Given the following contents exist
    | heading_title | heading_content | heading_image_url | about_title | about_content | announcements_heading | announcements_content |
    | default       | default         | default           | default     | default       | default               | default               |
    
    Given a logged in user

  Scenario: Go to profile page
    Given I am on the profile page
    Then I should see "Welcome, aabbcc@gmail.com"
    And I should see "Edit Your Profile"

  Scenario: Update user information
    Given I am on the profile page
    And I fill in "user_firstname" with "Bob"
    And I fill in "user_lastname" with "God"
    And I fill in "user_major" with "Electrical Engineering and Computer Science"
    And I press "Update User"
    Then I should see "Welcome"
    Then I should see "Email: aabbcc@gmail.com"
    Then I should see "Current major: Electrical Engineering and Computer Science"