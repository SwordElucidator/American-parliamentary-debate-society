Feature: Forum
  
  As a user of the forum, I want to read and write posts so that
  I can use the forum.
  
   # Background: users database is exist as follows
 #   Given the following users exist
 #   | email            | encrypted_password |
 #   | aabbcc@gmail.com | abc                |

    Background: database is exist as follows
        Given the following posts exist:
        | title   | content     |
        | TEST    | aaaa        |

        Given the following contents exist:
        | heading_title | heading_content | heading_image_url | about_title | about_content | announcements_heading | announcements_content |
        | default       | default         | default           | default     | default       | default               | default               |
        
        Given the following sections exist:
        | title |
        | General |
        
        Given a logged in user

    Scenario: users can write posts
    Given I am on the home page of the General
    When I follow "New Post"
    Then I should be on the new post page
    
    Scenario: users can create new post
    Given I am on the new post page
    When I fill in "post_title" with "test"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    Then I should be on the "test" detail page
    
    Scenario: users can read posts
    Given I am on the new post page
    When I fill in "post_title" with "test"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "test"
    Then I should be on the "test" detail page
    
    
    
    Scenario: users can write comments
    Given I am on the "TEST" detail page
    When I press "Create Comment"
    Then I should be on the "TEST" detail page
    
    Scenario: users are able to destroy comments
    Given I am on the "TEST" detail page
    When I press "Create Comment"
    And I follow "Delete"
    Then I should be on the "TEST" detail page
    
    Scenario: users are able to update comments
    Given I am on the "TEST" detail page
    When I press "Create Comment"
    And I follow "Edit"
    And I fill in "comment_comment" with "test"
    And I press "Update Comment"
    Then I should be on the "TEST" detail page