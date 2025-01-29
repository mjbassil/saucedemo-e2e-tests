
import { When, Then, Given, DataTable } from "@badeball/cypress-cucumber-preprocessor"

Given("I am on the log in page", () => {
    cy.visit(Cypress.env("baseUrl"))
});

Given("I log in with the following credentials :", (dataTable: DataTable) => {
    dataTable.hashes().forEach(elem => {
        cy.get(`[data-test="${elem.key}"]`).type(elem.value)
    });
    cy.get("[data-test='login-button']").click()
});

Then("I log out", () => {
    cy.get("#react-burger-menu-btn").click()
    cy.get("[data-test='logout-sidebar-link']").click()
});

Then("an error should appear with the message {string}", (errorMessage: string) => {
    cy.get("[data-test='error']")
        .should("be.visible")
        .should("contain", errorMessage)
});

When("I close the error message", () => {
    cy.get("[data-test='error-button']").click()
});

Then("the error message box is red", () => {
    cy.get("[data-test='error']").parent().should("have.css", "background-color", "rgb(226, 35, 26)")
});

Then("the error should not exist", () => {
    cy.get("[data-test='error']").should("not.exist")
});
