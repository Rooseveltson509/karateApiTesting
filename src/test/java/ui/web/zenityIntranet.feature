Feature: Test de l'application web de l'intranet zenity sur l'environnement de test

  Scenario: connexion à l'intranet sur la version ordinateur du site
    * configure driver = web.navigateur
    Given driver web.zenityIntranetUrl
    And driver.maximize()
    And driver.input('#user_login', web.identifiant, true)
    And driver.input('#user_pass', web.motdepasse, true)
    When driver.click('#wp-submit')
    And driver.waitUntil("document.readyState == 'complete'")
    Then match driver.text('#prenomNomDeco') contains web.nom