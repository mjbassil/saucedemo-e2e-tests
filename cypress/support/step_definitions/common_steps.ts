import { When, Then } from "@badeball/cypress-cucumber-preprocessor"
const _ = require("lodash");

Then("I am on the login page", function () {
    cy.visit(Cypress.env("baseUrl"))
});