import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';

Then("the response body should have created user {string}", (body) => {
    const parsedBodyname = JSON.parse(body); 
    const expectedName = parsedBodyname.name; // Extracting name
  
    const parsedBodyJob = JSON.parse(body); 
    const expectedJob = parsedBodyJob.job; // Extract job
  
    cy.assertResponseField('name', expectedName, 'equal'); // Assert that 'name' is correct
    cy.assertResponseField('job', expectedJob, 'equal'); // Assert that 'job' is correct
    cy.assertTimestampField("createdAt");

});

  