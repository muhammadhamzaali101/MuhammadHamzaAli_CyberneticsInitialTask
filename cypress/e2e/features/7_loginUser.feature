Feature: Login user Related End Points

Scenario Outline: Verify that user can successfully login with valid email and password
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And Verify token created successfully
  
  Examples:
     | method | url         | requestBody                                                    | statusCode |
     | "POST" | "api/login" | "{\"email\":\"eve.holt@reqres.in\",\"password\":\"testing\"}"  | 200        |

Scenario Outline: Verify that validation message in resposne when email is incorrect
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And Verify validation message <message>
  
  Examples:
     | method | url         | requestBody                                              | statusCode | message                     |
     | "POST" | "api/login" | "{\"email\":\"test@test.com\",\"password\":\"testing\"}" | 400        | "user not found" |
  
Scenario Outline: Verify that validation message in resposne when email is missing
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And Verify validation message <message>
  
  Examples:
     | method | url         | requestBody                                 | statusCode | message                     |
     | "POST" | "api/login" | "{\"email\":\"\",\"password\":\"testing\"}" | 400        | "Missing email or username" |
     | "POST" | "api/login" | "{\"password\":\"testing\"}"                | 400        | "Missing email or username" |

# This can be a case but demo endpoints are not handling it that's why not able to automate it

Scenario Outline: Verify that validation message in resposne when password is incorrect
  # Given I send a <method> request to <url> with body <requestBody>
  # Then the response status should be <statusCode>
  # And Verify validation message <message>
  
  # Examples:
  #    | method | url         | requestBody                                                     | statusCode | message            |
  #    | "POST" | "api/login" | "{\"email\":\"eve.holt@reqres.in\",\"password\":\"invalid\"\"}" | 400        | "Invalid password" |

Scenario Outline: Verify that validation message in resposne when password is missing
  Given I send a <method> request to <url> with body <requestBody>
  Then the response status should be <statusCode>
  And Verify validation message <message>
  
  Examples:
     | method | url         | requestBody                                            | statusCode | message            |
     | "POST" | "api/login" | "{\"email\":\"eve.holt@reqres.in\",\"password\":\"\"}" | 400        | "Missing password" |
     | "POST" | "api/login" | "{\"email\":\"eve.holt@reqres.in\"}"                    | 400        | "Missing password" |

