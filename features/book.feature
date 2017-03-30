Feature: booking page
  Scenario: list of books
    Given following books
      | title | price | description |
      | Give me a chance | 10000 | Hung Le |
      | Don't give up | 20000 | Vinh Tran |
    And Signed me in system
    When I visit index page
    Then I should see the list of books