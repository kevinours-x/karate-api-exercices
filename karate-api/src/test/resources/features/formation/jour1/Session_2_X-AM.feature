Feature:

Background:
* url 'https://automation.xelians-dev.fr'




Scenario: X-AM - Création d'un utilisateur avec vérification (JSON dans le code)

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

  * def uuidGenerique = java.util.UUID.randomUUID()
* def emailUser = 'admin.' + uuidGenerique + '@xelians.fr'

* print uuidGenerique
* print emailUser

Given path '/identity/identity-api/users/'

And request 
"""
{ "enabled": true,
    "email": "#(emailUser)",
    "firstname": "KGI2510091015",
    "lastname": "KGI2510091015",
    "mobile": null,
    "phone": null,
    "domain": "xelians-dev.fr",
    "groupId": "68e5133046fabb5f908f7178249a5ac1372a43b58a27adb306505474a469d99a",
    "customerId": "system_customer",
    "otp": false,
    "type": "NOMINATIVE",
    "subrogeable": false,
    "status": "ENABLED",
    "userInfoId": "68e76f37548b4f6fc9bd18dc30af3f28d23a4e0396f2b33dca810f431f4e7e0a",
    "address": {
        "street": null,
        "zipCode": null,
        "city": null,
        "country": "FR"
    },
    "internalCode": null,
    "siteCode": null,
    "centerCodes": null,
    "autoProvisioningEnabled": false }
    """
When method POST
Then status 200 
* print response

* def utilisateurID = response.id
* def utilisateurEmail = response.email
* print utilisateurID
* print utilisateurEmail

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

Given path '/identity/identity-api/users/'
And param id = utilisateurID
And param email = utilisateurEmail
When method GET
Then status 200
* print response


Scenario: X-AM - Création d'un utilisateur avec vérification (JSON dans un fichier)

* header Accept = 'application/json, text/plain, */*'
* header Accept-Encoding = 'gzip, deflate, br, zstd'
* header Content-Type = 'application/json'
* header Connection = 'keep-alive'
* header X-Application-Id = 'USERS_APP'
* header X-Tenant-Id = '10'

* def token = 'TOK-960-BlzI3YCUFLpbnFajWPDYh-eygiFnvofM'
* header Authorization = 'Bearer ' +  token
* print token 

* def uuidGenerique = java.util.UUID.randomUUID()
* def emailUser = 'admin.' + uuidGenerique + '@xelians.fr'

* print uuidGenerique
* print emailUser

* def requeteFichier = read("classpath:data/requeteUtilisateur.json")
* print requeteFichier

Given path '/identity/identity-api/users/'
And request requeteFichier
When method POST
Then status 200 
* print response

* def utilisateurID = response.id
* def utilisateurEmail = response.email
* print utilisateurID
* print utilisateurEmail

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

* karate.write(response, 'reponse2.json')



Scenario: X-AM - helper

* def uuidGenerique = java.util.UUID.randomUUID()
* def emailUserValeurGenerique = 'admin.' + uuidGenerique + '@xelians.fr'

# création du user
* def user1 = call read('classpath:helpers/creationUser.feature') {emailUser: "#(emailUserValeurGenerique)"}

#* print user1.response.id
* def utilisateurID_C = user1.response.id
* def utilisateurEmail_C = user1.response.email
* print utilisateurID_C
* print utilisateurEmail_C

# check user
* def user2 = call read('classpath:helpers/checkUser.feature') {utilisateurID: "#(utilisateurID_C)", utilisateurEmail: "#(utilisateurEmail_C)"}














