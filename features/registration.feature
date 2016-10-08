Feature: Registration test

  Background: On Reg Page
    Given I'm on the redmine website
    When Click on the 'Register' link

  @positive
  Scenario: Register user with valid credentials
    When Fill all fields on the register form with valid values
    When Click 'Submit' button
    Then Verify text about successfull registration

  @negative
  Scenario Outline: Register user with not valid credentials
    When Fill all fields on the register form with not valid values "<login>"/"<pass>"
    When Click 'Submit' button
    Then Verify message about not valid values "<message>"

    Examples:
    |login  |pass |   message                                            |
    |       |1234 |   Email is invalid                              |
    |login  |123  |   Password is too short (minimum is 4 characters)    |