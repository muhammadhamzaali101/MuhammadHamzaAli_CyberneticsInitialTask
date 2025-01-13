import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';

Given("I send a {string} request to {string}", (method, url) => {
    cy.sendRequest(method, Cypress.config("baseUrl") + url);
});

Then("the response status should be {int}", (status) => {
    cy.assertResponseField('status', status, 'equal'); // Assert that 'status' is as expected
});

Then("the response body should have all users listed of that page {int}", (page) => {

    cy.assertResponseBodyHasUsersArray(); // Assert that response is array
    cy.assertResponseField('per_page', 6, 'equal'); // Assert that 'per_page' is correct
    cy.assertResponseField('page', page, 'equal'); // Assert that 'page' is correct
});


Then(/^Data (.+) are as expected$/, (keys) => {
    const keysArray = keys.split(","); // Convert the string of keys into an array
    cy.assertUserFields(keysArray);
});

Then("the response body should have user id {int}", (id) => {
    cy.assertResponseField('data.id', id, 'equal');
    // cy.assertUserId(id);
});

Then("the response body should have no data", () => {
    cy.assertResponseField('data', [], 'empty');
    cy.assertUserFields();
    cy.assertResponseField('per_page', 6, 'equal');

    // cy.assertNoDataInResponse();
    // cy.assertPerPage();
});

Given("I send a {string} request to {string} with body {string}", (method, url, requestBody) => {
    // Parse the JSON string from the feature file
    const body = requestBody !== "null" ? JSON.parse(requestBody) : null;
    cy.sendRequest(method, Cypress.config("baseUrl") + url, body);
});

Then("Verify validation message {string}", (message) => {
    cy.assertResponseField('error', message, 'equal'); // Assert that 'id' is correct
});
