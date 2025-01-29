import { When, Then, Given, DataTable } from "@badeball/cypress-cucumber-preprocessor"

//LOGIN
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

Then("an error should appear with the message {string}", (errorMessage) => {
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

//Products


Then("the {string} button is not visible anymore", (buttonText: string) => {
    cy.contains(buttonText).should("not.exist")
});

Then("the {string} button is visible", (buttonText: string) => {
    cy.contains(buttonText).should("exist").and("be.visible")
});

When('I click on the item number {int} to add it to the cart', (itemNumber: number) => {
    cy.get(`[data-test="inventory-list"] > :nth-child(${itemNumber})`).within(() => {
        cy.contains("Add to cart").click()
    })
})

When('I click on the item number {int} to remove it from the cart', (itemNumber: number) => {
    cy.get(`[data-test="inventory-list"] > :nth-child(${itemNumber})`).within(() => {
        cy.contains("Remove").click()
    })
})

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
})

When("I add the item to the cart", () => {
    cy.get("[data-test='add-to-cart'").click()
})

When("I remove the item to the cart", () => {
    cy.get("[data-test='remove'").click()
})

When("I go back to the products page", () => {
    cy.get("[data-test='back-to-products'").click()
})
//Redirection
Then("I'm redirected to the inventory page", () => {
    cy.url().should('include', '/inventory.html')
});

Then("I'm redirected to the cart page", () => {
    cy.url().should('include', '/cart.html')
});

Then("I'm redirected to the inventory item page", () => {
    cy.url().should('include', '/inventory-item.html')
});

// CART
Then("the shopping cart badge isn't visible", () => {
    cy.get("[data-test='shopping-cart-badge']").should("not.exist")
});

When("I click on the {string} button", (buttonId) => {
    cy.get(`[data-test="${buttonId}"]`).click()
});

Then("the shopping cart badge is visible containing {int}", (nbOfItems: number) => {
    cy.get("[data-test='shopping-cart-badge']").contains(nbOfItems)
});

Then("I fill out the checkout form with the following information :", (dataTable: DataTable) => {
    dataTable.hashes().forEach(elem => {
        cy.get(`[data-test="${elem.key}"]`).type(elem.value)
    });
});

When("I click on the cart icon", () => {
    cy.get("[data-test='shopping-cart-link']").click()
})

Then("I remove item number {int} from the cart", (itemNumber: number) => {
    var tableIndex = itemNumber + 2;
    cy.get(`[data-test="cart-list"] > :nth-child(${tableIndex})`).within(() => {
        cy.contains("Remove").click()
    })
})

