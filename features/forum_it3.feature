Feature: Forum
  
    As a forum user, I want to receive a pop out alert when I delete posts/comments, 
    so that I will not delete my posts by mistake.
    
   # Background: users database is exist as follows
 #   Given the following users exist
 #   | email            | encrypted_password |
 #   | aabbcc@gmail.com | abc                |

    Background: database is exist as follows
    Given a logged in user
    Given the following posts exist:
    | title   | content     |
    | TEST    | aaaa        |
    Given the following sections exist:
    | tittle  |
    | General1|
    | General2|
    
    
    
    Scenario: users will receive notice when delete a post
    Given I am on the home page of the forum
    When I follow "New Post"
    And I fill in "post_title" with "test title"
    And I press "Create Post"
    And I follow "Delete"
    Then I should not be on the home page of the forum
    
    Scenario: users will receive notice when delete a comment
    Given I am on the home page of the forum
    When I follow "New Post"
    And I fill in "post_title" with "test title"
    And I press "Create Post"
    And I press "Create Comment"
    And I follow "Delete"
    Then I should not be on the "test title" detail page
    
    
    As a forum user, I want to see different sections of the forum, 
    so that I can write/read posts according to topic.
    
    Scenario: users can click into one section
    Given I am on the home page of the forum
    When I follow "General1"
    Then I should be on the "General1" detail page

    Scenario: users will not go to wrong section (sad path)
    Given I am on the home page of the forum
    When I follow "General2"
    Then I should not be on the "General1" detail page
