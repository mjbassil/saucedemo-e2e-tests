import { When, Then } from "@badeball/cypress-cucumber-preprocessor"

Then("the {string} button is not visible anymore", (buttonText: string) => {
    cy.contains(buttonText).should("not.exist")
});

Then("the {string} button is visible", (buttonText: string) => {
    cy.contains(buttonText).should("exist").and("be.visible")
});

When("I click on the item number {int} to add it to the cart", (itemNumber: number) => {
    cy.get(`[data-test="inventory-list"] > :nth-child(${itemNumber})`).within(() => {
        cy.contains("Add to cart").click()
    })
});

When("I click on the item number {int} to remove it from the cart", (itemNumber: number) => {
    cy.get(`[data-test="inventory-list"] > :nth-child(${itemNumber})`).within(() => {
        cy.contains("Remove").click()
    })
});

Then("the item number {int} {string} button is not visible anymore", (itemNumber: number, buttonText: string) => {
    cy.get(`[data-test="inventory-list"] > :nth-child(${itemNumber})`).within(() => {
        cy.contains(buttonText).should("not.exist")
    })
});

Then("the item number {int} {string} button is visible", (itemNumber: number, buttonText: string) => {
    cy.get(`[data-test="inventory-list"] > :nth-child(${itemNumber})`).within(() => {
        cy.contains(buttonText).should("be.visible")
    })
});

When("I click on item number {int} to see its information", (itemNumber: number) => {
    cy.get(`[data-test="inventory-list"] > :nth-child(${itemNumber})`).within(() => {
        cy.get("[data-test='inventory-item-name']").click()
    })
});

When("I add the item to the cart", () => {
    cy.get("[data-test='add-to-cart'").click()
});

When("I remove the item to the cart", () => {
    cy.get("[data-test='remove'").click()
});

When("I go back to the products page", () => {
    cy.get("[data-test='back-to-products'").click()
});
