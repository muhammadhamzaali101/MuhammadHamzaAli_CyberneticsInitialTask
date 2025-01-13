import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';


Then("Verify token created successfully", () => {
    cy.assertResponseField('token', "", 'exist'); // Assert that 'id' is correct
});

  