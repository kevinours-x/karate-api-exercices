Feature:

Background:
    # * url 'https://jsonplaceholder.typicode.com'
    * url 'http://localhost:3001/'
    # * url 'https://smtp-xam.xelians-dev.fr/'
    # * url smtpUrl

Scenario:

    * call read('classpath:features/formation/jour1/04-exercices-jour1.feature')
