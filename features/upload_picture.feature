Feature: Upload pictures to the home page
    
    As an admin
    I want to be able to upload pictures to the site
    So that they are shown on the home page
    
    Background: Admin is logged in
        Given the following invitation codes exist:
        |                    code                        |
        |     d3942dce589a8baf879be01b717184712b119a72   |
        Given the following users exist:
        |      email           |    password    |    password_confirmation  |              code                          | is_admin |
        |   admin@admin.com    |    asdfghjk    |    asdfghjk               |  d3942dce589a8baf879be01b717184712b119a72  | true     |

    Scenario: Admin can edit the pictures on the home page
        Given I am on the login page
        When I fill in "user_email" with "admin@admin.com"
        And I fill in "user_password" with "asdfghjk"
        And I press "Sign In"
        And I go to the edit section of the admin dashboard
        Then I should see "Heading image1"
        And I should see "Leader image1"
    
    Scenario: Non-admin users should not be able to edit pictures
        Given a logged in user
        When I go to the edit section of the admin dashboard
        Then I should not see "Heading image1"
        And I should not see "Leader image1"
        And I should be on the home page of the website