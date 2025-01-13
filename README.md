# Cypress Automation Testing Project with Cucumber and Mochawesome Reporting
This project is a robust automation testing framework using Cypress, Cucumber, and Mochawesome. It supports behavior-driven development (BDD) with feature files, generates detailed reports automatically, and provides reusable functions and step definitions for scalable testing.

## Prerequisites

Before running the project, ensure your environment meets the following requirements:

- Node.js (>= 14.x)
- npm (>= 6.x)
You can download and install Node.js from Node.js Official Website.

## Setup Instructions
### Install Cypress and Required Dependencies: 
Run the following commands to install all necessary packages:
- npm install  \\ to reinstall missing packages.
- npm install cypress --save-dev  \\ version = "^13.17.0"
- npm install @badeball/cypress-cucumber-preprocessor --save-dev
- npm install @bahmutov/cypress-esbuild-preprocessor --save-dev
- npm install cypress-mochawesome-reporter --save-dev
- npm install mochawesome --save-dev
- npm install mochawesome-merge --save-dev
- npm install cypress-plugin-api --save-dev
- npm install axios

Verify Installation: After running npm install, ensure the node_modules folder is present and all dependencies are installed.

## Project Structure
Here is how project is organized

project-root/
├── cypress/
│   ├── e2e/
│   │   ├── *.feature         # Feature files defining test scenarios
│   ├── reports/              # Directory for storing reports
│   │   ├── mochawesome/      # Automatically generated Mochawesome reports
│   ├── support/              # Support files
│   │   ├── helper/           # Reusable functions
│   │   │   ├── helper.js     # Helper functions file
│   │   ├── step-definitions/ # Step definitions for feature files
│   │   │   ├── *.js          # Step definition files
│   │   ├── commands.js       # Custom Cypress commands
│   │   ├── e2e.js            # Global hooks and configurations
├── cypress.config.js         # Cypress configuration file
├── package.json              # Project dependencies and scripts
├── README.md                 # Project documentation


## Execution

  ### Run All Tests in Headless Mode for multiple browsers:
     
  ### Run All Tests in Default Headless Mode:
    - npm run test
    Executes all tests in the headless mode using the default browser (Electron). Reports are automatically generated.

  ### Run Tests in Chrome (Headless):
    - npm run cy:chrome:headless
    Executes all tests in Chrome headless mode, ideal for CI/CD pipelines.

  ### Run Tests in Edge (Headless):
    - npm run cy:edge:headless
    Executes all tests in Edge headless mode for compatibility testing.

  ### Run Tests in Electron (Headless):
    - npm run cy:electron:headless
    Executes all tests in the lightweight Electron browser headless mode.

  ### Run Tests in Chrome (Interactive):
    - npm run cy:chrome
    Opens Cypress Test Runner in Chrome for debugging and interactive execution.

  ### Run Tests in Edge (Interactive):
    - npm run cy:edge
    Opens Cypress Test Runner in Edge for interactive execution.

  ### Run Tests in Electron (Interactive):
    - npm run cy:electron
    Opens Cypress Test Runner in Electron for interactive execution.

  ## Run a Specific Feature File:   
     - npx cypress run --spec "cypress/e2e/<file-name>.feature"
  
  ### Run Tests in Interactive Mode:
     - npx cypress open
     - Select the .feature file from the Cypress Test Runner to execute the tests interactively.

## Automatic Report Generation
   The Mochawesome reporter automatically generates a report after test execution because of configuration as below.
   
### The reports are stored in:
  - cypress/reports/mochawesome/
   If +reports" folder doesn't exist then it will be created automatically upon execution of framework
  
  reporter: "cypress-mochawesome-reporter",
    reporterOptions: {
      reportDir: "cypress/reports/mochawesome", // Specify your report directory
      overwrite: false,  // Don't overwrite existing reports
      html: true, // Enabled, will create .html upon execution 
      json: false // Disable JSON report
    }

## View the Report
   Simply open the index.html file in a browser to view the test results.