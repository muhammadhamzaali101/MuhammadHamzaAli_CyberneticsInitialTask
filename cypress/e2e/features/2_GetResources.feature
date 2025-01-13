Feature: GET Resources list or single resource Related End Points

Scenario Outline: Verify that user is able to list all resouces
  Given I send a <method> request to "api/unknown"
  Then the response status should be <statusCode>
  And the response body should have all users listed of that page <page> 
  And Data <keys> are as expected
  
  Examples:
      | method | page | statusCode | keys                             |
      | "GET"  | 1    | 200        | id,name,year,color,pantone_value |

Scenario Outline: Verify that user is able to "GET" specific list by ID
  Given I send a <method> request to "api/unknown/<ID>"
  Then the response status should be <statusCode>
  And the response body should have user id <ID>

  Examples:
      | method   | ID | statusCode |
      | "GET"    | 1  | 200        |
      | "GET"    | 2  | 200        |
  

Scenario Outline: Verify that when invalid resouce ID provided then 404 returned
  Given I send a <method> request to "api/unknown/<ID>"
  Then the response status should be <statusCode>
  Then the response status should be <statusCode>

  Examples:
      | method   | userID | statusCode |
      | "GET"    | 23     | 404        |