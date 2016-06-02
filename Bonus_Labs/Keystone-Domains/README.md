#**Exercise 4.4** Create a new role 'test_role' and access APIs with that role#

##**Overview**##
In this exercise you are going to create a new role and access the API 'domain list' with that role.
Create a new role 'test_role'. Create an user 'test_user' in 'default' domain with password 'password'. Assign 'test_role' to the user 'test_user' on domain 'default'.

Edit the policy file to access domain list by role 'test_role'. And check the user 'test_user' is able to get the domain list.
**Task 1**: Create the role 'test_role'
**Task 2**: Create user 'test_user' and assign 'test_role' on domain 'default'
**Task 3**: Edit the policy file and check domain list using 'test_user' credentials

**Required Setup**
Access to Ubuntu OpenStack machine with 'jq' package.
