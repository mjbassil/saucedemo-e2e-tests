# End to end tests tests on "saucedemo.com" website

## Languages used

Cypress
Gherkin

## Installing and opening cypress
To install cypress : https://docs.cypress.io/app/get-started/install-cypress  
To open the application : https://docs.cypress.io/app/get-started/open-the-app  
To install typescript : https://docs.cypress.io/app/tooling/typescript-support

## Installing cucumber
After installing npm, cypress and typescript run the following command :
```
npm install @bahmutov/cypress-esbuild-preprocessor
```
```
npm install @badeball/cypress-cucumber-preprocessor
```
Make sure to have the same code put in cypress.config.ts

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

I used a scenario outline to run the same scenario mutliple times with different users (standard_user, problem_user, etc.)  
A verification of the error message box is done at the end of all the negative log in test cases.

### Add item to a cart
