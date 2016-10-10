@test
Feature: All Redmine tests
  Here I put all tests from main project

  Background: Registration
    Given I'm provide a correct registration

  @s1
  Scenario: Test verify possibility to change password
    When click My account link
    When change password
    When click Apply button
    When logout
    When login witn changed password
    Then Verify that I enter on site with new password

  @s2
  Scenario: New project creation
    When logout
    When registrate second user
    When login with first user
    When create new project
    When add new user to project with login2
    Then verify that user was added

