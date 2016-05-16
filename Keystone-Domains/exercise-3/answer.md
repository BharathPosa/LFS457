### Answer for Exercise-3: Testing domain specific identity

#### Task-1: Enable the domain specific options in the Keystone conf file
1. Open the Keystone configuration file

        $ sudo vi /etc/keystone/keystone.conf
2. Under section `[identity]`, uncomment the below lines

        domain_specific_drivers_enabled = true
        domain_config_dir = /etc/keystone/domains
3. Create a directory _/etc/keystone/domains_

        $ sudo mkdir /etc/keystone/domains
4. Restart the apache2 server 

        $ sudo service apache2 restart

#### Task-2: Create a domain and configure the domain specific identity configuration
1. Create a domain `enterprise_cloud`

          $ openstack domain create enterprise_cloud

2. Configure the LDAP server details for `enterprise_cloud` domain
    1. Create a file _keystone.enterprise_cloud.conf_ in _domains_ directory and open it for edit
    
          $ sudo vi /etc/keystone/domains/keystone.enterprise_cloud.conf
    
    2. Write the LDAP server configuration to _keystone.enterprise_cloud.conf_
      > Hint: Use the file _keystone.enterprise_cloud.conf_ for reference and edit the
      appropriate fields like `ip`
    3. Save and exit the file

3. Restart the `apache2` service

      $ sudo service apache2 restart

#### Task-3: Verify user login from Horizon

1. List the available users in domain `enterprise_cloud`

      $ openstack user --domain=enterprise_cloud list
      
2. Now you can see a user `gopal` in user list
3. Browse the dashboard and access the horizon using below credentials:

  * Domain: enterprise_cloud
  * User Name: gopal
  * Password: welcome123
