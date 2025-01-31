Feature: Add products to the cart test cases

  Scenario: Adding items from homepage and removing them from the cart page
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value         |
      | username | standard_user |
      | password | secret_sauce  |
    Then I'm redirected to the inventory page
    And the shopping cart badge is not visible
    When I click on the item number 1 to add it to the cart
    Then the shopping cart badge is visible containing 1
    And the item number 1 "Add to cart" button is not visible anymore
    And the item number 1 "Remove" button is visible
    When I click on the item number 2 to add it to the cart
    Then the shopping cart badge is visible containing 2
    And the item number 2 "Add to cart" button is not visible anymore
    And the item number 2 "Remove" button is visible
    When I click on the item number 3 to add it to the cart
    Then the shopping cart badge is visible containing 3
    And the item number 3 "Add to cart" button is not visible anymore
    And the item number 3 "Remove" button is visible
    When I click on the cart icon
    Then I'm redirected to the cart page
    And the shopping cart badge is visible containing 3
    When I remove item number 1 from the cart
    Then the shopping cart badge is visible containing 2
    When I remove item number 2 from the cart
    Then the shopping cart badge is visible containing 1
    When I remove item number 3 from the cart
    Then the shopping cart badge is not visible
    And I log out

  Scenario: Adding and removing one item from inventory item page
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value         |
      | username | standard_user |
      | password | secret_sauce  |
    Then I'm redirected to the inventory page
    And the shopping cart badge is not visible
    When I click on item number 5 to see its information
    Then I'm redirected to the inventory item page
    When I add the item to the cart
    Then the shopping cart badge is visible containing 1
    And the "Add to cart" button is not visible anymore
    And the "Remove" button is visible
    When I remove the item to the cart
    And the shopping cart badge is not visible
    And the "Remove" button is not visible anymore
    And the "Add to cart" button is visible
    When I add the item to the cart
    And I go back to the products page
    Then I'm redirected to the inventory page
    And the shopping cart badge is visible containing 1
    When I click on the item number 5 to remove it from the cart
    And the shopping cart badge is not visible
    And I log out

  Scenario: Verify cart is cleared out after checkout
    Given I am on the log in page
    When I log in with the following credentials :
      | key      | value         |
      | username | standard_user |
      | password | secret_sauce  |
    Then I'm redirected to the inventory page
    And the shopping cart badge is not visible
    When I click on the item number 4 to add it to the cart
    Then the shopping cart badge is visible containing 1
    When I click on the cart icon
    Then I'm redirected to the cart page
    When I click on the "checkout" button
    And I fill out the checkout form with the following information :
      | key        | value  |
      | firstName  | MJ     |
      | lastName   | BASSIL |
      | postalCode |  38000 |
    Then I'm redirected to the checkout step "one" page
    When I click on the "continue" button
    Then I'm redirected to the checkout step "two" page
    When I click on the "finish" button
    Then I'm redirected to the checkout complete page
    When I go back to the products page
    Then I'm redirected to the inventory page
    And the shopping cart badge is not visible
    And I log out
