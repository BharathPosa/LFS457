### Answer to Exercise-2: Managing projects in domains
#### Task 1: Create domains, projects and users with roles
1. Export the environment variables to access Keystone APIs

        $ source ~/openrc

    (or)
    
        $ export OS_IDENTITY_API_VERSION=3
        $ export OS_AUTH_URL=http://127.0.0.1:35357/v3
        $ export OS_DEFAULT_DOMAIN=default
        $ export OS_USERNAME=admin
        $ export OS_PASSWORD=password
        $ export OS_PROJECT_NAME=admin
2. Run the [setup.sh](setup.sh) to create domains `linux`, `marvel` and `dc` with `user`

        $ bash setup.sh

<br>

#### Task-2: Update the policy file and make user ubuntu as cloud_admin
1. Take the backup of file _/etc/keystone/policy.json_

        $ sudo cp /etc/keystone/policy.json /etc/keystone/policy.json.bkp
2. Delete all the contents in _/etc/keystone/policy.json_

        $ sudo truncate -s0 /etc/keystone/policy.json
3. Copy all the text from _v3cloudsample.json_ and paste in _/etc/keystone/policy.json_ file

        $ sudo bash -c 'cat v3cloudsample.json > /etc/keystone/policy.json'
4. Open file _/etc/keystone/policy.json_ and on line no 3, replace `admin_domain_id` string with `linux` domain ID.

        "cloud_admin": "role:admin and (token.is_admin_project:True or domain_id:<linux-domain-id>)"
5. Save and quit the file (Press `Esc`, type `:wq` and `Enter`)

<br>

#### Task-3: Verify project management by all users
__TEST-1:__ Domain admin creating project in his own domain  
Create a project `avengers` in domain `marvel` using
`hulk` credentials. It should success because `hulk` is the admin of the domain `marvel`

1. Get the token using `hulk` credentials
    1. Create a file [_domain-scoped.json_](domain-scoped.json) and write the user credentials
    
              $ vi domain-scoped.json
              {
                  "auth": {
                      "identity": {
                          "methods": [
                              "password"
                          ],
                          "password": {
                              "user": {
                                  "domain": {
                                      "name": "marvel"
                                  },
                                  "name": "hulk",
                                  "password": "greenhulk"
                              }
                          }
                      },
                      "scope": {
                          "domain": {
                              "name": "marvel"
                          }
                      }
                  }
              }

      > Hint: Take the reference from [_domain-scoped.json_](domain-scoped.json) and
      configure json file properly: domain - marvel, username - hulk  and password - greenhulk

    2. Get the token using above credntials file

              $ TOKEN=$(curl -is -d @domain-scoped.json -H "Content-type: application/json" \
              http://127.0.0.1:35357/v3/auth/tokens | grep ^X-Subject-Token: | awk '{print $2}' )
              $ echo $TOKEN
2. Create a project `avengers` using the above generated token
    1. Write the project configuration into a file _create-project.json_
    
              $ vi create-project.json
              {
                  "project": {
                      "description": "Description",
                      "domain_id": "<domain ID>",
                      "enabled": true,
                      "is_domain": false,
                      "name": "<proj-name>"
                  }
              }
    
      > Hint: Take the reference from [_create-project.json_](create-project.json) and
      configure json file properly: domain_id - <marvel-domain-id>, name - avengers, description - 'Marvel Avengers'
      
    2. Create project using above [_create-project.json_](create-project.json) file
    
              $ curl -s -H"X-Auth-Token:$TOKEN" -H"Content-type: application/json"  \
              -d @create-project.json http://127.0.0.1:35357/v3/projects | jq "."

__TEST-2:__ Domain admin creating project in different domain
Create a project `faultyProject` in domain `dc` using hulk credentials. 
It should fail because `hulk` is not the admin of domain `dc`

1. Create a project `faultyProject` in domain `dc` using `hulk` credentials
    1. Open the file [_create-project.json_](create-project.json) for edit and update the project name to `faultyProject` and update `domain_id` to
domain id of `dc`.
      > Hint: Take the reference from _create-project.json_ and
      configure json file properly: domain_id - <dc-domain-id>, name - faultyProject, description - 'Faulty Project'
    2. Request to create project using above file.
    
              $ curl -s -d @create-project.json -H"X-Auth-Token:$TOKEN" -H "Content-type: application/json" \
              http://127.0.0.1:35357/v3/projects | jq "."


__TEST-3:__ cloud_admin creating project in a different domain
Create a project `legends` in domain `dc` using `ubuntu` user credentials.
It will success becuse `ubuntu` has cloud_admin role

1. Get the token using `ubuntu` user credentials
    1. Write the `ubuntu` user credentials to [_domain-scoped.json_](domain-scoped.json) file
    2. Request the token using _domain-scoped.json_
    
              $ TOKEN=$(curl -is -d @domain-scoped.json -H "Content-type: application/json" \
              http://127.0.0.1:35357/v3/auth/tokens | grep ^X-Subject-Token: | awk '{print $2}' )
              $ echo $TOKEN

2. Request to create a project "legends" in domain "dc" using above file
    1. Write the project details in a file _create_details.json_
        > Hint: Take the reference from _create-project.json_ and
      configure json file properly: domain_id - <dc-domain-id>, name - legends, description - 'DC Legends'
    
    2. Request the Keystone to create a project `legends` using above json file

              $ curl -s -d @create-project.json -H"X-Auth-Token:$TOKEN" -H "Content-type: application/json" \
              http://127.0.0.1:35357/v3/projects | jq "."


----------------

#### Revert back the policy file:
             $ sudo cp /etc/keystone/policy.json.bkp /etc/keystone/policy.json

