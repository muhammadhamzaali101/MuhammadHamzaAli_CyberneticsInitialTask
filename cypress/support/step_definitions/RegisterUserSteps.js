import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';

Then("Verify ID {int} of user", (ID) => {
    cy.assertResponseField('id', ID, 'equal'); // Assert that 'id' is correct
});

  