Feature: Registration test

  Scenario: Register user with appropriate credentials
    Given I'm on the redmine website
    When Click on the 'Register' link
    When Fill all fields on the register form with valid values
    When Click 'Submit' button
    Then Verify text about successfull registration
