@javascript
Feature: user authentication

  Scenario: user logs in
    Given a user with username "hung@yopmail.com" and password "password"
    When I sign in manually as "hung@yopmail.com" with password "password"
    Then I should be on the welcome page

  Scenario: user logs out
    Given I am signed in
    And I click on "Logout" link
    Then I should "Login" link



