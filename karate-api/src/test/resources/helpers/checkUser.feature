Feature:

Scenario:

* url 'https://automation.xelians-dev.fr'    

* header Accept = 'application/json, text/plain, */*'
* header Accept-Encoding = 'gzip, deflate, br, zstd'
* header Content-Type = 'application/json'
* header Connection = 'keep-alive'
* header X-Application-Id = 'USERS_APP'
* header X-Tenant-Id = '10'

# /!\ fonction à implémenter /!\
# Utiliser le token
* def token = 'TOK-960-BlzI3YCUFLpbnFajWPDYh-eygiFnvofM'
* header Authorization = 'Bearer ' +  token
* print token 

Given path '/identity/identity-api/users/' + utilisateurID
# And param id = utilisateurID
# And param email = utilisateurEmail
When method GET
Then status 200
* print response    