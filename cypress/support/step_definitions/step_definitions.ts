import { When, Then, Given } from "@badeball/cypress-cucumber-preprocessor"
const _ = require("lodash");

Given("I am on the log in page", () => {
    cy.visit(Cypress.env("baseUrl"))
});

When("I type {string} in {string}", (input, cellId) => {
    cy.get(`[data-test="${cellId}"]`).type(`${input}`)
})

When("I click on the {string}", (buttonId) => {
    cy.get(`[data-test="${buttonId}"]`).click()
})

Then("I'm redirected to the inventory page", () => {
    cy.url().should('include', '/inventory.html')
})

Then("I log out", () => {
    cy.get("#react-burger-menu-btn").click()
    cy.get("[data-test='logout-sidebar-link']").click()
})

Then("an error should appear with the message {string}", (errorMessage) => {
    cy.get("[data-test='error']")
        .should("be.visible")
        .should("contain", errorMessage)
})

Then("the error message box is red", () => {
    cy.get("[data-test='error']").parent().should("have.css", "background-color", "rgb(226, 35, 26)")
})

Then("the error should not exist", () => {
    cy.get("[data-test='error']").should("not.exist")

})