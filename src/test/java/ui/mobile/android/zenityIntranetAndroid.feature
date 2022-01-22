Feature: Test de l'application web de l'intranet zenity sur l'environnement de test

  Scenario: connexion à l'intranet sur la version mobile du site
    * configure driver = {type: 'android'}
    Given driver mobile.driverCaps
    And driver web.zenityIntranetUrl
    * driver.waitUntil("document.readyState == 'complete'")
    And driver.input("//*[@resource-id='user_login']", web.identifiant, true)
    And driver.input("//*[@resource-id='user_pass']", web.motdepasse, true)
    When driver.click("//*[@resource-id='wp-submit']")
    * driver.waitUntil("document.readyState == 'complete'")
    Then match driver.text("//*[@resource-id='prenomNomDeco']") contains web.nom


