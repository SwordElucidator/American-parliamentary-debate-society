Feature: forum
  
  As a user of the forum, I want to go to the forum page from landing page (and vice versa),
  so that I can using the website smoothly.
 
 # Background: users database is exist as follows
 #   Given the following users exist
 #   | email            | encrypted_password |
 #   | aabbcc@gmail.com | abc                |

  # Background: database is exist as follows
  #   Given the following posts exist:
  #   | title   | content     |
  #   | TEST    | aaaa        |
  
  Background: the home page content exists
    Given the following contents exist
    | heading_title | heading_content | heading_image_url | about_title | about_content | announcements_heading | announcements_content |
    | default       | default         | default           | default     | default       | default               | default               |
    
    Given a logged in user
 # Scenario: users can write posts
 # Given I am on the home page of the forum
 # When I follow "New_Post"
 # Then I should be on the new post page
 
 # Scenario: users can read posts
 # Given I am on the home page of the forum
 # When I follow "TEST"
 # Then I should be on the "TEST" detail page
 
 Scenario: users can go to forum from landing page
 Given I am on the home page of the website
 When I follow "Forum"
 Then I should be on the home page of the forum
 
 Scenario: users can go to landing page from forum
 Given I am on the home page of the forum
 When I follow "Debate"
 Then I should be on the home page of the website 
 
 
  