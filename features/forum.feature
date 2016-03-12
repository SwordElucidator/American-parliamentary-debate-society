Feature: forum
 
 # Background: users database is exist as follows
 #   Given the following users exist
 #   | email            | encrypted_password |
 #   | aabbcc@gmail.com | abc                |


 
 # Scenario: users can write posts
 # Given I am on the home page of the forum
 # When I follow "New_Post"
 # Then I should be on the new post page
 
 # Scenario: users can read posts
 # Given I am on the home page of the forum
 # When I follow "test"
 # Then I should be redirected to "/posts/9"
 
 Scenario: users can go to forum from landing page
 Given I am on the home page of the website
 When I press forum
 Then I should be redirected to the home page of the forum
 
 Scenario: users can go to landing page from forum
 Given I am on the home page of the forum
 When I click logo
 Then I should be redirected to the home page of the website 
 
 
  