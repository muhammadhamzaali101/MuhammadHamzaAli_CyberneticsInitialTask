Feature: Register user Related End Points

Scenario Outline: Verify that user can successfully register with valid data
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And Verify ID <ID> of user
  
  Examples:
     | method | url            | ID | requestBody                                                    | statusCode |
     | "POST" | "api/register" | 4  | "{\"email\":\"eve.holt@reqres.in\",\"password\":\"testing\"}"  | 200        |

Scenario Outline: Verify that validation message in resposne when email is incorrect
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And Verify validation message <message>
  
  Examples:
     | method | url            | requestBody                                              | statusCode | message                                         |
     | "POST" | "api/register" | "{\"email\":\"test@test.com\",\"password\":\"testing\"}" | 400        | "Note: Only defined users succeed registration" |


Scenario Outline: Verify validation message in resposne when email missing while registering
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And Verify validation message <message>
  
  Examples:
     | method | url            | requestBody                                 | statusCode | message                     |
     | "POST" | "api/register" | "{\"email\":\"\",\"password\":\"testing\"}" | 400        | "Missing email or username" |
     | "POST" | "api/register" | "{\"password\":\"testing\"}"                | 400        | "Missing email or username" |
     | "POST" | "api/register" | "{}"                                        | 400        | "Missing email or username" |

Scenario Outline: Verify validation message in resposne when password missing while registering
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And Verify validation message <message>
  
  Examples:
     | method | url            | requestBody                                            | statusCode | message            |
     | "POST" | "api/register" | "{\"email\":\"eve.holt@reqres.in\",\"password\":\"\"}" | 400        | "Missing password" |
     | "POST" | "api/register" | "{\"email\":\"eve.holt@reqres.in\"}"                   | 400        | "Missing password" |
