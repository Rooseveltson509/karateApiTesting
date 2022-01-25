Feature: Sample Post API

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response.json")

  # Simple Post request
  Scenario: Post Test one
    Given url 'https://reqres.in/api/users'
    And request {"name": "Mireille","job": "student"}
    When method POST
    Then status 201
    And print response


   # Simple Post request with params
  Scenario: Post Test two
    Given path '/users'
    And request {"name": "Mireille","job": "student"}
    When method POST
    Then status 201
    And print response


  # Simple Post request with assertions
  Scenario: Post Test three
    Given path '/users'
    And request {"name": "Mireille","job": "student"}
    When method POST
    Then status 201
    And match response == {"createdAt": "#ignore","name": "Mireille","id": "#string","job": "student"}
    And print response

  # Simple Post with read response from file
  Scenario: Post Test four
    Given path '/users'
    And request {"name": "Mireille","job": "student"}
    When method POST
    Then status 201
    And match $ == expectedOutput
    And print response


  # Simple Post with read request body from file
  Scenario: Post Test five
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath+'/src/test/java/data/userdata.json'
    And print filePath
    And def requestBody1 = filePath
    And  request requestBody1
    When method POST
    Then status 201
    #And match response == expectedOutput
    #And match $ == expectedOutput
    And print response

  # Simple Post with read response from file
  Scenario: Post Test six
    Given path '/users'
    And def reqBody = read("response.json")
    And set reqBody.job = 'engineer'
    And request reqBody
    When method POST
    Then status 201
    #And match $ == expectedOutput
    And print response