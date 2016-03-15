Feature: forum
 
 # Background: users database is exist as follows
 #   Given the following users exist
 #   | email            | encrypted_password |
 #   | aabbcc@gmail.com | abc                |

  # Background: database is exist as follows
  #   Given the following posts exist:
  #   | title   | content     |
  #   | TEST    | aaaa        |
 
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
 When I follow "American Parliamentary Debate Society Forum"
 Then I should be on the home page of the website 
 
 
  