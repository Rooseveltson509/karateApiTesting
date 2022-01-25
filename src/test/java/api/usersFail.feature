@non-reg
Feature: PUT PAI Request test

  @UserFail
  Scenario: PUT API demo 1
    Given url 'https://reqres.in/api/users/2'
    And request {"name": "morpheus", "job": "zion resident" }
    When method PUT
    # Status attendu 200 mais on veut un test fail pour les rapports
    Then status 400