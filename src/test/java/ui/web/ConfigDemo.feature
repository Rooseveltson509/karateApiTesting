Feature: Config demo 1

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Config demo 1

    Given print name

  # Simple Get Request
  @UserPass
  Scenario: Get Demo one (1)
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response