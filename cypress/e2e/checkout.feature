Feature: Check out cases

  Scenario Outline: Nominal case user log in
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value         |
      | username | standard_user |
      | password | secret_sauce  |
    Then I'm redirected to the inventory page
    And the shopping cart badge is not visible
    When I click on the item number 1 to add it to the cart
    When I click on the cart icon
    Then I'm redirected to the cart page
    When I click on the "checkout" button
    Then I'm redirected to the checkout step "one" page
    When I fill out the checkout form with the following information :
      | key        | value  |
      | firstName  | MJ     |
      | lastName   | Bassil |
      | postalCode |  38000 |
    And I click on the "continue" button
    Then I'm redirected to the checkout step "two" page
    When I click on the "finish" button
    Then I'm redirected to the checkout complete page
    And the header "Thank you for your order!" appears on the page
    And the text "Your order has been dispatched, and will arrive just as fast as the pony can get there!" appears on the page
    When I click on the back home button
    Then I'm redirected to the inventory page

  Scenario Outline: Missing parameter : firstname
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value         |
      | username | standard_user |
      | password | secret_sauce  |
    Then I'm redirected to the inventory page
    And the shopping cart badge is not visible
    When I click on the item number 1 to add it to the cart
    When I click on the cart icon
    Then I'm redirected to the cart page
    When I click on the "checkout" button
    Then I'm redirected to the checkout step "one" page
    When I fill out the checkout form with the following information :
      | key        | value  |
      | lastName   | Bassil |
      | postalCode |  38000 |
    And I click on the "continue" button
    Then the error message "Error: First Name is required" with appear

  Scenario Outline: Missing parameter : lastName
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value         |
      | username | standard_user |
      | password | secret_sauce  |
    Then I'm redirected to the inventory page
    And the shopping cart badge is not visible
    When I click on the item number 1 to add it to the cart
    When I click on the cart icon
    Then I'm redirected to the cart page
    When I click on the "checkout" button
    Then I'm redirected to the checkout step "one" page
    When I fill out the checkout form with the following information :
      | key        | value |
      | firstName  | MJ    |
      | postalCode | 38000 |
    And I click on the "continue" button
    Then the error message "Error: Last Name is required" with appear

  Scenario Outline: Missing parameter : postal code
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value         |
      | username | standard_user |
      | password | secret_sauce  |
    Then I'm redirected to the inventory page
    And the shopping cart badge is not visible
    When I click on the item number 1 to add it to the cart
    When I click on the cart icon
    Then I'm redirected to the cart page
    When I click on the "checkout" button
    Then I'm redirected to the checkout step "one" page
    When I fill out the checkout form with the following information :
      | key        | value |
      | firstName  | MJ    |
      | lastName | Bassil |
    And I click on the "continue" button
    Then the error message "Error: Postal Code is required" with appear