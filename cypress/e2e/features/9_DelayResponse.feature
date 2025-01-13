Feature: Delay Response to fetch users Related End Points


# Cypress Automatically handles delay responsebecasue cypress wait 
# for response to be returned for specific period of time and in out 
# case response returned before that
Scenario Outline: Verify delay response is being captured
  Given I send a <method> request to "api/users?delay=3"
  Then the response status should be <statusCode>
  And Data <keys> are as expected
  
  Examples:
      | method | statusCode | keys                                 |
      | "GET"  | 200        | id,email,first_name,last_name,avatar |