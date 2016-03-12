Feature: forum
 
 Scenario: users can write posts
 Given I am on the home page of the forum
 When I click new post
 Then I should see input field
 
 Scenario: users can read posts
 Given I am on the home page of the forum
 When I click a post
 Then I should be redirected to the post detail page
 
 Scenario: users can go to forum from landing page
 Given I am on the home page of the website
 When I click forum
 Then I should be redirected to the home page of the forum
 
 Scenario: users can go to landing page from forum
 Given I am on the home page of the forum
 When I click logo
 Then I should be redirected to the home page of the website 
 
 
  