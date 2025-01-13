Feature: Delete user Related End Points

Scenario Outline: Verify that user can successfully delete specific user ID
  Given I send a <method> request to "<url>/<userID>"
  Then the response status should be <statusCode>
  
  Examples:
     | method   | url       | userID | statusCode |
     | "DELETE" | api/users | 1      | 204        |
     | "DELETE" | api/users | 2      | 204        |

Scenario Outline: Verify that user can successfully delete all users
  Given I send a <method> request to "<url>/<userID>"
  Then the response status should be <statusCode>
  
  Examples:
     | method   | url       | statusCode |
     | "DELETE" | api/users | 204        |
