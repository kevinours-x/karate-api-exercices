Feature:

Scenario:

* url 'https://automation.xelians-dev.fr'

* header Accept = 'application/json, text/plain, */*'
* header Accept-Encoding = 'gzip, deflate, br, zstd'
* header Content-Type = 'application/json'
* header Connection = 'keep-alive'
* header X-Application-Id = 'USERS_APP'
* header X-Tenant-Id = '10'
* def token = 'TOK-960-BlzI3YCUFLpbnFajWPDYh-eygiFnvofM'
* header Authorization = 'Bearer ' +  token
* print token     

* print uuidGenerique
* print emailUser

* def requeteFichier = read("classpath:data/requeteUtilisateur.json")
* print requeteFichier

Given path '/identity/identity-api/users/'
And request requeteFichier
When method POST
Then status 200 
* print response