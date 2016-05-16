## Keystone Domains

#### Exercise-1: Create a user in a new domain and access Horizon
##### Overview
By default, Horizon only allows users in `default` domain. In this exercise you are going login to dashboard with
a user from the different domain.

Create a new domain `galaxy`. In `galaxy` create a project `planet_jakku`. Create a user `rey` in domain
`galaxy` with default project `planet_jakku` and password `starwars`. Assign `admin` role to `rey` on project
`planet_jakku`. Configure the horizon to keystone v3 so that Horizon allows all domain users to login. Login to
dashboard with `rey` credentials.

* _Task-1:_ Create domain `galaxy`, project `planet_jakku` and user `rey`. 
Assign admin role to `rey` on project `panet_jakku`
* _Task-2:_ Configure Horizon to Keystone v3
* _Task-3:_ Login to Horizon using `rey` credentials

Answer: [Ans](exercise-1/answer.md)  
Required setup:
* Access to OpenStack installed node

-------------------------------

#### Exercise-2: Managing projects in domains
##### Overview
Create 3 domains; `linux`, `marvel`, `dc`.
* In domain `linux`
  * Create a user `ubuntu` with password `debian`
  * Assign `admin` role to user `ubuntu` on domain `linux`
* In domain `marvel`
  * Create a user `hulk` with password `greenhulk`
  * Assign `admin` role to user `hulk` on domain `marvel` 
* In domain `dc`
  * Create user `arrow` with password `greenarrow`
  * Assign `admin` role to user `arrow` on domain `dc`

By default, an admin user can create any project in any domain. That means the user `hulk` from `marvel` 
can create a project in domain `dc`. Now you have to change the policy file to achieve the following result:

* User `ubuntu`: (super admin)
  * Can create any project in any domain
* User `hulk`:
  * Can only manage projects in `marvel` domain
* User `arrow`:
  * Can only manage projects in `dc` domain

Run the following test Cases to confirm the above results:
1. Try create a project `avengers` in domain `marvel` using `hulk` credentials.
2. Try to create a project `faultyProject` in domain `dc` using `hulk` credentials. (Should fail)
3. Try to create a project `legends` in domain `dc` using `ubuntu` credentials

  
Tasks to do

* _Task-1:_ Create domains, projects and users with roles (Run script to complete this task)
* _Task-2:_ Update the Keystone policy to 
[policy.v3cloudsample.json](https://github.com/openstack/keystone/blob/master/etc/policy.v3cloudsample.json) 
and make domain `linux` as admin_domain
* _Task-3:_ Test project creations in different domains to achieve above results

Answer: [Ans](exercise-2/answer.md)  
Required setup: 
* Access to OpenStack installed node

--------------------------------

#### Exercise-3: Testing domain specific identity

In this exercise you're going to test domain specific identity feature. Commonly, OpenStack installation comes
with `sql` identity backend. So Default domain uses the `sql` backend for identity. Create a new domain and it should use
LDAP backend for identity while default using `sql` backend.

Instructor will provide you details of a LDAP server. Create a new domain `enterprise_cloud` and configure its 
identity backend to provided LDAP configuration. List the available users and you'll see the user `gopal`.
Create a project `bigdata` in `enterprise_cloud` and add `admin` role to `gopal` on project `bigdata`. Now login to Horizon
using domain `enterprise_cloud`, user `gopal` and password `welcome123`

##### Overview
* _Task-1:_ Enable the domain specific options in the Keystone conf file
* _Task-2:_ Create a domain and configure the domain specific identity configuration
* _Task-3:_ Verify user logins from Horizon

Answer:  [Ans](exercise-3/answer.md)  
Required setup:
* Access to Openstack installed node
* Ubuntu machine with LDAP server
