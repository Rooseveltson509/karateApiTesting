@non-reg
Feature: Get API demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

    # Simple Get Request
  @UserPass
  Scenario: Get Demo one (1)
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

    # Get with Background
  @UserPass
  Scenario: Get Demo one (2)
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response


    # Get with path parameters
  @UserPass
  Scenario: Get Demo one (3)
    Given path '/users'
    And param page = 1
    When method GET
    Then status 200
    And print response


    # Get with path Assertions
  @UserPass
  Scenario: Get Demo one (4)
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].last_name != null
    And assert response.data.length == 6
    And match $.data[3].id == 10
    And match response.data[4].last_name == 'Edwards'