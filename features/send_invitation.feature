Feature: Mock Debate Page
 
  As an administritor
  I want to send invitation code
  So that I can invite new students
  
  Background: users database is exist as follows
    Given the following contents exist:
    |  heading_title |  heading_content |about_title |about_content |announcements_heading |announcements_content |
    | a        |b|c|d|e|f|
    Given the following invitation codes exist:
    |                    code                        |
    |     d3942dce589a8baf879be01b717184712b119a72   |
    Given the following users exist:
    |      email           |    password    |    password_confirmation  |              code                          |  firstname | lastname | is_admin |
    |   admin@admin.com    |    asdfghjk    |    asdfghjk               |  d3942dce589a8baf879be01b717184712b119a72  |   Hao      |  God     | true     |

  Scenario: admin on invitation page legal 
      Given I am on the SendInvitation page
        And I should have field "email"
  And I should have field "password"
  When I fill in "user_email" with "admin@admin.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I go to the SendInvitation page
  And I fill in "email" with "abcd@567.com"
  And I press "Generate Invitation Code"
  
  Scenario: admin fill in illegal invitation email
      Given I am on the SendInvitation page
        And I should have field "email"
  And I should have field "password"
  When I fill in "user_email" with "admin@admin.com"
  And I fill in "user_password" with "asdfghjk"
  And I press "Sign In"
  And I go to the SendInvitation page
  And I fill in "email" with "abcd"
  And I press "Generate Invitation Code"    