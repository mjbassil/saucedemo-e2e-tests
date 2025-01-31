Feature: Log in test cases

  Scenario Outline: Nominal case user log in
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value        |
      | username | <username>   |
      | password | secret_sauce |
    Then I'm redirected to the inventory page
    And I log out

    Examples:
      | username                |
      | standard_user           |
      | problem_user            |
      | performance_glitch_user |
      | error_user              |
      | visual_user             |

  Scenario: Locked out user log in
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value           |
      | username | locked_out_user |
      | password | secret_sauce    |
    Then an error should appear with the message "Epic sadface: Sorry, this user has been locked out."
    And the error message box is red
    When I close the error message
    Then the error should not exist

  Scenario: Log in without a username
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value        |
      | password | secret_sauce |
    Then an error should appear with the message "Epic sadface: Username is required"
    And the error message box is red
    When I close the error message
    Then the error should not exist

  Scenario: Log in without a password
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value         |
      | username | standard_user |
    Then an error should appear with the message "Epic sadface: Password is required"
    And the error message box is red
    When I close the error message
    Then the error should not exist

  Scenario: Log in without a username and password
    Given I am on the log in page
    When I click on the login button
    Then an error should appear with the message "Epic sadface: Username is required"
    And the error message box is red
    When I close the error message
    Then the error should not exist

  Scenario Outline: Invalid username/password
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value      |
      | username | <username> |
      | password | <password> |
    Then an error should appear with the message "Epic sadface: Username and password do not match any user in this service"
    And the error message box is red
    When I close the error message
    Then the error should not exist

    Examples:
      | username         | password         |
      | invalid_username | secret_sauce     |
      | standard_user    | invalid_password |
