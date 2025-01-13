Feature: Creating New User Related End Points

Scenario Outline: Verify that user is able to create a new user with valid inforamtion
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have created user <requestBody> 
  
  Examples:
     | method | url         | requestBody                                        | statusCode |
     | "POST" | "api/users" | "{\"name\":\"Muhammad\",\"job\":\"SQAE\"}"         | 201        |
     | "POST" | "api/users" | "{\"name\":\"Hamza\",\"job\":\"Testing\"}"         | 201        |
     | "POST" | "api/users" | "{\"name\":\"Ali\",\"job\":\"Quality Assurance\"}" | 201        |


Scenario Outline: Verify that user is able to create user without job
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have created user <requestBody> 
  
  Examples:
     | method | url         | requestBody                              | statusCode |
     | "POST" | "api/users" | "{\"name\":\"Muhammad\",\"job\":\"\"}"   | 201        |



Scenario Outline: Verify that user is able to create user without name
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have created user <requestBody> 
  
  Examples:
     | method | url         | requestBody                            | statusCode |
     | "POST" | "api/users" | "{\"name\":\"\",\"job\":\"SQAE\"}"     | 201        |


Scenario Outline: Verify that user is able to create user without name and job
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have created user <requestBody> 
  
  Examples:
     | method | url         | requestBody                      | statusCode |
     | "POST" | "api/users" | "{\"name\":\"\",\"job\":\"\"}"   | 201        |
     | "POST" | "api/users" | "{}"                             | 201        |


Scenario Outline: Verify that user is able to create a new user with numeric name and job
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have created user <requestBody> 
  
  Examples:
     | method | url         | requestBody                          | statusCode |
     | "POST" | "api/users" | "{\"name\":123,\"job\":456}"         | 201        |
