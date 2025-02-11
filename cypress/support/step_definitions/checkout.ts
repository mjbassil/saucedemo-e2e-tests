import { DataTable, When, Then } from "@badeball/cypress-cucumber-preprocessor"


When("I fill out the checkout form with the following information :", (dataTable: DataTable) => {
    dataTable.hashes().forEach(elem => {
        cy.get(`[data-test="${elem.key}"]`).type(elem.value)
    });
});

Then("the header {string} appears on the page", (message) => {
    cy.get("[data-test='complete-header']").should('contain', message)
})

Then("the text {string} appears on the page", (message) => {
    cy.get("[data-test='complete-text']").should('contain', message)
})

When("I click on the back home button", () => {
    cy.get("[data-test='back-to-products']").click()
})

Then("the error message {string} with appear", (errorMessage) => {
    cy.get(".error-message-container")
        .should("be.visible")
        .should("contain", errorMessage)
})