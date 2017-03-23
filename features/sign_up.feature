@javascript
Feature: Sign up a user
  Scenario: sing up a user
    Given visit sign up page
    And I fill out the sign up form
    When I click on "Sign up" button
    Then I should be on the welcome page
