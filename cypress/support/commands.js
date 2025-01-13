// cypress/support/commands.js
import { assertContains, assertDeepEqual, assertEmpty, assertEqual, assertExists } from '../support/helper/helper';


    Cypress.Commands.add('sendRequest', (method, url, body = null) => {
        cy.request({
          method: method,  // The HTTP method passed (GET, POST, etc.)
          url: url,        // The URL
          body: body,      // Optional request body for POST, PUT, PATCH
          failOnStatusCode: false,  // Prevent Cypress from failing the test on non-2xx status codes
        }).as("apiResponse");
        cy.log(url)
    });
  
  Cypress.Commands.add('assertResponseBodyHasUsersArray', () => {
    cy.get("@apiResponse").then((response) => {
      cy.wrap(response.body.data).should("be.an", "array").and("have.length.greaterThan", 0);
    });
  });
  
  Cypress.Commands.add('assertUserFields', (keys) => {
    cy.get('@apiResponse').then((response) => {
        // Iterate over each user object and check if the keys match
        cy.wrap(response.body.data).each((item) => {
            assertDeepEqual(Object.keys(item), keys)
        });
      });
  });
  
  Cypress.Commands.add('assertResponseField', (fieldPath, expectedValue, comparisonType = 'equal') => {
    cy.get("@apiResponse").then((response) => {
        cy.log("In new command")
        let actualValue;
    
        // Check if the fieldPath is 'status' or other top-level response fields
        if (fieldPath === 'status') {
            actualValue = response.status; // Access response-level fields directly
        } else {
            actualValue = Cypress._.get(response.body, fieldPath); // Access body-level fields
        }
    
        switch (comparisonType) {
            case 'equal':
                assertEqual(actualValue, expectedValue);
                break;
            case 'contain':
                assertContains(actualValue, expectedValue);
                break;
            case 'exist':
                assertExists(actualValue);
                break;
            case 'empty':
                assertEmpty(actualValue);
                break;
            default:
                throw new Error(`Unknown assertion type: ${assertionType}`);
        }
    });
  });
    
    Cypress.Commands.add('assertTimestampField', (fieldName) => {
        cy.get("@apiResponse").then((response) => {
            
        const fieldValue = response.body[fieldName]; // Access the dynamic field
        expect(fieldValue).to.exist; // Ensure the field exists in the response
    
        const fieldDate = new Date(fieldValue); // Parse the timestamp
        const currentTime = new Date().toISOString(); // Get the current system time in ISO 8601 format
    
        // Assert the timestamp is close to the current time (within 6 seconds)
        expect(fieldDate.getTime()).to.be.closeTo(new Date(currentTime).getTime(), 6000);
        });
    });
  
  