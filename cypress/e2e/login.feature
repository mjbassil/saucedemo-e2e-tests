Feature: Log in test cases

  Scenario Outline: Positive user log in
    Given I am on the log in page
    When I type "<username>" in "username"
    And I type "secret_sauce" in "password"
    And I click on the "login-button"
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
    When I type "locked_out_user" in "username"
    And I type "secret_sauce" in "password"
    And I click on the "login-button"
    Then an error should appear with the message "Epic sadface: Sorry, this user has been locked out."
    And the error message box is red
    When I click on the "error-button"
    Then the error should not exist

  Scenario: Log in without a username
    Given I am on the log in page
    When I type "secret_sauce" in "password"
    And I click on the "login-button"
    Then an error should appear with the message "Epic sadface: Username is required"
    And the error message box is red
    When I click on the "error-button"
    Then the error should not exist

  Scenario: Log in without a password
    Given I am on the log in page
    When I type "standard_user" in "username"
    And I click on the "login-button"
    Then an error should appear with the message "Epic sadface: Password is required"
    And the error message box is red
    When I click on the "error-button"
    Then the error should not exist

  Scenario: Log in without a username and password
    Given I am on the log in page
    When I click on the "login-button"
    Then an error should appear with the message "Epic sadface: Username is required"
    And the error message box is red
    When I click on the "error-button"
    Then the error should not exist

  Scenario: Invalid username/password
    Given I am on the log in page
    When I type "<username>" in "username"
    And I type "<password>" in "password"
    And I click on the "login-button"
    Then an error should appear with the message "Epic sadface: Username and password do not match any user in this service"
    And the error message box is red
    When I click on the "error-button"
    Then the error should not exist

    Examples:
      | username         | password         |
      | invalid_username | secret_sauce     |
      | standard_user    | invalid_password |
