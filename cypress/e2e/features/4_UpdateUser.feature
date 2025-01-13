Feature: Update users (PUT, PATCH) Related End Points

Scenario Outline: Verify that user is updated sucessfuully usign PUT
  Given I send a <method> request to "<url>/<userID>" with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have updated information <requestBody> 
  
  Examples:
     | method | url       | userID | requestBody                                           | statusCode |
     | "PUT"  | api/users | 1      | "{\"name\":\"updated Name\",\"job\":\"Updated job\"}" | 200        |


Scenario Outline: Verify that user is updated sucessfully with empty name field usign PUT
  Given I send a <method> request to "<url>/<userID>" with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have updated information <requestBody> 
  
  Examples:
     | method | url       | userID | requestBody                               | statusCode |
     | "PUT"  | api/users | 1      | "{\"name\":\"\",\"job\":\"Updated job\"}" | 200        |


Scenario Outline: Verify that user is updated sucessfuully with empty Job field usign PUT
  Given I send a <method> request to "<url>/<userID>" with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have updated information <requestBody> 
  
  Examples:
     | method | url       | userID | requestBody                                           | statusCode |
     | "PUT"  | api/users | 1      | "{\"name\":\"updated Name\",\"job\":\"\"}" | 200        |


Scenario Outline: Verify that user is updated sucessfuully when body is empty usign PUT
  Given I send a <method> request to "<url>/<userID>" with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have updated information <requestBody> 
  
  Examples:
     | method | url       | userID | requestBody                                           | statusCode |
     | "PUT"  | api/users | 1      | "{}" | 200        |


# *******Cannot automate this scenario because these demo APIs are throwing success response when 
# trying to input invalid of non existent user ID*********

Scenario Outline: Verify that endpoit failed when invalid or non existent user provided usign PUT
#   Given I send a <method> request to "<url>/<userID>" with body <requestBody>
#   Then the response status should be <statusCode>
#   And the response body should have updated information <requestBody> 
  
#   Examples:
#      | method | url       | userID | requestBody                                           | statusCode |
#      | "PUT"  | api/users | 412312 | "{\"name\":\"updated Name\",\"job\":\"Updated job\"}" | 200        |




Scenario Outline: Verify that user is updated sucessfuully usign PATCH
  Given I send a <method> request to "<url>/<userID>" with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have updated information <requestBody> 
  
  Examples:
     | method  | url       | userID | requestBody                                           | statusCode |
     | "PATCH" | api/users | 1      | "{\"name\":\"updated Name\",\"job\":\"Updated job\"}" | 200        |


Scenario Outline: Verify that user is updated sucessfully when only name provided usign PATCH
  Given I send a <method> request to "<url>/<userID>" with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have updated information <requestBody> 
  
  Examples:
     | method | url       | userID | requestBody                               | statusCode |
     | "PATCH"  | api/users | 1      | "{\"name\":\"only Name\"}" | 200        |


Scenario Outline: Verify that user is updated sucessfuullywhen only job provided usign PATCH
  Given I send a <method> request to "<url>/<userID>" with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have updated information <requestBody> 
  
  Examples:
     | method  | url       | userID | requestBody                                           | statusCode |
     | "PATCH" | api/users | 1      | "{\"job\":\"only job\"}" | 200       |


Scenario Outline: Verify that user is updated sucessfuully when body is empty usign PATCH
  Given I send a <method> request to "<url>/<userID>" with body <requestBody>
  Then the response status should be <statusCode>
  And the response body should have updated information <requestBody> 
  
  Examples:
     | method  | url       | userID | requestBody    | statusCode |
     | "PATCH" | api/users | 1      | "{}"           | 200        |

# *******Cannot automate this scenario because these demo APIs are throwing success response when 
# trying to input invalid of non existent user ID*********

Scenario Outline: Verify that endpoit failed when invalid or non existent user provided usign PATCH
#   Given I send a <method> request to "<url>/<userID>" with body <requestBody>
#   Then the response status should be <statusCode>
#   And the response body should have updated information <requestBody> 
  
#   Examples:
#      | method  | url       | userID | requestBody                                           | statusCode |
#      | "PATCH" | api/users | 13123  | "{\"name\":\"updated Name\",\"job\":\"Updated job\"}" | 200        |

