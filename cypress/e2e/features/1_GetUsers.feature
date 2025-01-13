Feature: Users list or single user Related End Points

@User @Regression
Scenario Outline: Verify that user is able to "GET"all users list according to page
  Given I send a <method> request to "api/users?page=<pageNumber>"
  Then the response status should be <statusCode>
  And the response body should have all users listed of that page <pageNumber>
  And Data <keys> are as expected
  
  Examples:
      | method | pageNumber | statusCode | keys                                  |
      | "GET"   | 1          | 200        | id,email,first_name,last_name,avatar |
      | "GET"   | 2          | 200        | id,email,first_name,last_name,avatar |

  Scenario Outline: Verify that whe invalid page number is provided then no data returned
  Given I send a <method> request to "api/users?page=<pageNumber>"
  Then the response status should be <statusCode>
  And the response body should have no data
  And Data <keys> are as expected
  
  Examples:
      | method  | pageNumber | statusCode |keys                             |
      | "GET"   | 70         | 200        |id,name,year,color,pantone_value |
  

Scenario Outline: Verify that specific user daa fetched specifiaclly
  Given I send a <method> request to "api/users/<userID>"
  Then the response status should be <statusCode>
  And the response body should have user id <userID>

  Examples:
      | method  | userID | statusCode |
      | "GET"   | 1      | 200        |
      | "GET"   | 2      | 200        |
  

Scenario Outline: Verify that when invalid user ID provied then no 404 response with no data returned
  Given I send a <method> request to "api/users/<userID>"
  Then the response status should be <statusCode>

  Examples:
      | method  | userID | statusCode |
      | "GET"   | 23     | 404        |
    