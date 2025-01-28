import { When, Then, Given, DataTable } from "@badeball/cypress-cucumber-preprocessor"

Given("I am on the log in page", () => {
    cy.visit(Cypress.env("baseUrl"))
});

When("I type {string} in {string}", (input, cellId) => {
    cy.get(`[data-test="${cellId}"]`).type(`${input}`)
})

When("I click on the {string} button", (buttonId) => {
    cy.get(`[data-test="${buttonId}"]`).click()
})

Then("I'm redirected to the inventory page", () => {
    cy.url().should('include', '/inventory.html')
})

Then("I'm redirected to the cart page", () => {
    cy.url().should('include', '/cart.html')
})

Then("I'm redirected to the inventory item page", () => {
    cy.url().should('include', '/inventory-item.html')
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

Then("the shopping cart badge isn't visible", () => {
    cy.get("[data-test='shopping-cart-badge']").should("not.exist")
})

Then("the shopping cart badge is visibile containing {int}", (nbOfItems: number) => {
    cy.get("[data-test='shopping-cart-badge']").contains(nbOfItems)
})

Then("the {string} button is not visibile anymore", (buttonId) => {
    cy.get(`[data-test="${buttonId}"]`).should("not.exist")
})

Then("the {string} button is visible", (buttonId) => {
    cy.get(`[data-test="${buttonId}"]`).should("exist").and("be.visible")
})

Then("I fill out the checkout form with the following information :", (dataTable: DataTable) => {
    dataTable.hashes().forEach(elem => {
        cy.get(`[data-test="${elem.key}"]`).type(elem.value)
    });
})