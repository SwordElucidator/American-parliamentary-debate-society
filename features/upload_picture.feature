Feature: Upload pictures to the home page
    
    As an admin
    I want to be able to upload pictures to the site
    So that they are shown on the home page

    Scenario: Admin can edit the pictures on the home page
    Given I am on the edit home page
    And I follow "upload img1"
    And I select "president.jpg"
    And I press "Save"
    Then I should be on the home page of the website
    And I should see the picture of the President
    
    Scenario: Admin uploaded a picture but forgot to press "Save"
    Given I am on the edit home page
    And I follow "upload img1"
    And I select "president.jpg"
    And I go to the home page of the website
    Then I should not see the picture of the President