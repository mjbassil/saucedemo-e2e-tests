import { Then } from "@badeball/cypress-cucumber-preprocessor"

Then("I'm redirected to the inventory page", () => {
    cy.url().should("include", '/inventory.html')
});

Then("I'm redirected to the cart page", () => {
    cy.url().should("include", '/cart.html')
});

Then("I'm redirected to the inventory item page", () => {
    cy.url().should("include", '/inventory-item.html')
});

Then("I'm redirected to the checkout step {string} page", (checkoutStep: string) => {
    cy.url().should("include", `/checkout-step-${checkoutStep}.html`)
});

Then("I'm redirected to the checkout complete page", () => {
    cy.url().should("include", "/checkout-complete.html")
});
