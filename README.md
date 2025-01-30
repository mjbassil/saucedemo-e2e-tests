# End to end tests tests on "saucedemo.com" website

### Languages used

Typescript  
Gherkin

## Installations

## Run cypress tests

On the project folder run the command :
```
npm install
```
### Run a test on cypress 

To run **login.feature** and **add-to-cart.feature** via cypress, run the command :  

```
npm run cy:open
```

### Test cases JSON report

To run all test cases and generate a json report in the terminal, run the command :  

```
npx cypress run --spec "cypress/e2e/**.feature" 
```

![JSON report](/cypress/documentation/JSONReport.png)

### Installing and opening cypress
Node.js should be installed on your PC.
To install cypress : https://docs.cypress.io/app/get-started/install-cypress  
To open the application : https://docs.cypress.io/app/get-started/open-the-app  
To install typescript : https://docs.cypress.io/app/tooling/typescript-support

### Installing cucumber
After installing npm, cypress and typescript run the following command :
```
npm install @bahmutov/cypress-esbuild-preprocessor
```
```
npm install @badeball/cypress-cucumber-preprocessor
```
Make sure to have the same code put in _cypress.config.ts_

## Test cases covered

### Log in test cases

I created a `login.feature` file with for the log in test cases. 
The covered test cases are : 
- Positive user log in
- Locked out user log in
- Log in without a username
- Log in without a password
- Log in without a username and password
- Invalid username/password 

I used a scenario outline to run the same scenario multiple times with different users (standard_user, problem_user, etc.)  
A verification of the error message box is done at the end of all the negative log ins test cases.

### Add item to a cart

The three scenarios in `add-to-cart.feature` are : 
- Adding items from homepage and removing them from the cart page
- Adding and removing one item from inventory item page
- Verify cart is cleared out after checkout

Many cases are covered to make sure that the display is correct. In the scenario, we make sure that : 
- The button "Add to cart" disappears and is replaced by "Remove" when the user clicks on it.
- The button "Remove" disappears and is replaced by "Add to cart" when the user clicks on it.
- I can add to cart any item from the _inventory.html_ page and the _inventory-item.hml_ page.
- I can remove an item from the cart from the _cart.html_, _inventory.html_, and _inventory-item.html_ pages. 
- The redirection from any page to another is done correctly.
- I check the persistance of the cart badge when the user navigates through the pages.
- The cart is emptied once the user checks out.
- The cart number of item badge is not visible when the cart is empty.
- The cart badge shows the correct number of items in the cart.
