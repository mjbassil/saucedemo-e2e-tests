Feature: Add products to the cart test cases

  Scenario: Adding items from homepage and removing them from the cart page
    Given I am on the log in page
    * I type "standard_user" in "username"
    * I type "secret_sauce" in "password"
    * I click on the "login-button" button
    * I'm redirected to the inventory page
    And the shopping cart badge isn't visible
    When I click on the "add-to-cart-sauce-labs-backpack" button
    Then the shopping cart badge is visibile containing 1
    * the "add-to-cart-sauce-labs-backpack" button is not visibile anymore
    And the "remove-sauce-labs-backpack" button is visible
    When I click on the "add-to-cart-sauce-labs-bike-light" button
    Then the shopping cart badge is visibile containing 2
    * the "add-to-cart-sauce-labs-bike-light" button is not visibile anymore
    And the "remove-sauce-labs-bike-light" button is visible
    When I click on the "add-to-cart-sauce-labs-bolt-t-shirt" button
    Then the shopping cart badge is visibile containing 3
    * the "add-to-cart-sauce-labs-bolt-t-shirt" button is not visibile anymore
    And the "remove-sauce-labs-bolt-t-shirt" button is visible
    When I click on the "shopping-cart-link" button
    Then I'm redirected to the cart page
    * the shopping cart badge is visibile containing 3
    When I click on the "remove-sauce-labs-backpack" button
    Then the shopping cart badge is visibile containing 2
    When I click on the "remove-sauce-labs-bike-light" button
    Then the shopping cart badge is visibile containing 1
    When I click on the "remove-sauce-labs-bolt-t-shirt" button
    And the shopping cart badge isn't visible

  Scenario: Adding and removing one item from inventory item page
    Given I am on the log in page
    * I type "standard_user" in "username"
    * I type "secret_sauce" in "password"
    * I click on the "login-button" button
    * I'm redirected to the inventory page
    And the shopping cart badge isn't visible
    When I click on the "item-5-img-link" button
    Then I'm redirected to the inventory item page
    When I click on the "add-to-cart" button
    Then the shopping cart badge is visibile containing 1
    * the "add-to-cart" button is not visibile anymore
    And the "remove" button is visible
    When I click on the "back-to-products" button
    * I'm redirected to the inventory page
    Then the shopping cart badge is visibile containing 1
    Then I click on the "remove-sauce-labs-fleece-jacket" button
    And the shopping cart badge isn't visible

  Scenario: Verify cart is cleared out after checkout
    Given I am on the log in page
    * I type "standard_user" in "username"
    * I type "secret_sauce" in "password"
    * I click on the "login-button" button
    * I'm redirected to the inventory page
    And the shopping cart badge isn't visible
    When I click on the "add-to-cart-sauce-labs-backpack" button
    Then the shopping cart badge is visibile containing 1
    When I click on the "shopping-cart-link" button
    Then I'm redirected to the cart page
    When I click on the "checkout" button
    Then I fill out the checkout form with the following information :
      | key        | value  |
      | firstName  | MJ     |
      | lastName   | BASSIL |
      | postalCode |  38000 |
    And I click on the "continue" button
    And I click on the "finish" button
    And I click on the "back-to-products" button
    * I'm redirected to the inventory page
    And the shopping cart badge isn't visible
    ## then the "inventory-item" doesn't exist in cart
