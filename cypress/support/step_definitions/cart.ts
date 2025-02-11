import { When, Then, DataTable } from "@badeball/cypress-cucumber-preprocessor"

Then("the shopping cart badge is not visible", () => {
    cy.get("[data-test='shopping-cart-badge']").should("not.exist")
});

When("I click on the {string} button", (buttonId) => {
    cy.get(`[data-test="${buttonId}"]`).click()
});

Then("the shopping cart badge is visible containing {int}", (nbOfItems: number) => {
    cy.get("[data-test='shopping-cart-badge']").contains(nbOfItems)
});

When("I click on the cart icon", () => {
    cy.get("[data-test='shopping-cart-link']").click()
});

Then("I remove item number {int} from the cart", (itemNumber: number) => {
    let tableIndex = itemNumber + 2;
    cy.get(`[data-test="cart-list"] > :nth-child(${tableIndex})`).within(() => {
        cy.contains("Remove").click()
    })
});

When("I click on the login button", () => {
    cy.get("[data-test='login-button']").click()
});
