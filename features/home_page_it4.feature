Feature: View pictures

    As a general user
    I want to see pictures of the officers
    So that I get a better Idea of how APDS is
    
    Background:
      Given the following contents exist:
      | heading_title | heading_content | heading_image_url | about_title | about_content | announcements_heading | announcements_content |
      | default       | default         | default           | default     | default       | default               |  default              |
    
    Scenario: click on "Officers"
    Given I am on the home page of the website
    When I follow "Officers"
    Then I should be on the "Officers" section
    And I should see "President"
    And I should see "Soham"
    And I should see the picture of the President