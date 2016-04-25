Feature: Forum
  
    As a user of the forum, I want to have a next page button, so that the posts are not too messy.
    
    # Background: users database is exist as follows
    # Given the following users exist
    # | email            | encrypted_password |
    # | aabbcc@gmail.com | abc                |

    Background: database is exist as follows
    Given the following contents exist:
    | heading_title | heading_content | heading_image_url | about_title | about_content | announcements_heading | announcements_content |
    | default       | default         | default           | default     | default       | default               | default               |
    
    Given the following sections exist:
    | title |
    | General |
    | General1|
    | General2|
    
    Given a logged in user
    
    
    # Scenario: users will receive notice when delete a post
    # Given I am on the home page of the forum
    # When I follow "New Post"
    # And I fill in "post_title" with "test title"
    # And I press "Create Post"
    # And I follow "Delete"
    # Then I should not be on the home page of the forum
    
    # Scenario: users will receive notice when delete a comment
    # Given I am on the "TEST" detail page
    # And I press "Create Comment"
    # And I follow "Delete"
    # Then I should not be on the "test title" detail page
    
    Scenario: users can not see old post on first page if there are too many posts
    Given I am on the home page of the General
    When I follow "New Post"
    And I fill in "post_title" with "test not see"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test2"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test3"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test4"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test5"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test6"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test7"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test8"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test9"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test10"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test11"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    Then I should not see "test not see"

    Scenario: users can see old post on second page if there are too many posts
    Given I am on the home page of the General
    When I follow "New Post"
    And I fill in "post_title" with "test"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test2"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test3"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test4"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test5"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test6"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test7"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test8"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test9"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test10"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "New Post"
    And I fill in "post_title" with "test11"
    And I fill in "post_content" with "test text"
    And I press "Create Post"
    And I go to the home page of the General
    And I follow "2"
    Then I should see "test"