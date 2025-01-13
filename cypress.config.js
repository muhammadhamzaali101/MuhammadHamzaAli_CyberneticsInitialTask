const { defineConfig } = require("cypress");
const createBundler = require("@bahmutov/cypress-esbuild-preprocessor");
const preprocessor = require("@badeball/cypress-cucumber-preprocessor");
const createEsbuildPlugin = require("@badeball/cypress-cucumber-preprocessor/esbuild");

module.exports = defineConfig({
  projectId: "1z88oh", // Optional, if using Cypress Dashboard
  e2e: {
    baseUrl: "https://reqres.in/", // Change to your API base URL
    setupNodeEvents(on, config) {
      // Preprocessor for Cucumber and ESBuild
      on(
        "file:preprocessor",
        createBundler({
          plugins: [createEsbuildPlugin.default(config)],
        })
      );
      preprocessor.addCucumberPreprocessorPlugin(on, config);

      require('cypress-mochawesome-reporter/plugin')(on);

      return config;
    },
    specPattern: "cypress/e2e/features/**/*.feature", // Adjust to your feature file location
    reporter: "cypress-mochawesome-reporter",
    reporterOptions: {
      reportDir: "cypress/reports/mochawesome", // Specify your report directory
      overwrite: false,  // Don't overwrite existing reports
      html: true, // Enabled, will create .html upon execution 
      json: false // Disable JSON report
    }
  },
});
