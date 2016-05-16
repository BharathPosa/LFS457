### Answer to Exercise-1: Creating domain, project and user
#### Task-1: Create domain, project and user. Assign admin role to user on the project

1. Export the admin credentials to access Keystone v3 APIs

        $ source ~/openrc
  
  (or)
  
        $ export OS_IDENTITY_API_VERSION=3
        $ export OS_AUTH_URL=http://127.0.0.1:35357/v3
        $ export OS_DEFAULT_DOMAIN=default
        $ export OS_USERNAME=admin
        $ export OS_PASSWORD=password
        $ export OS_PROJECT_NAME=admin

2. Create a domain `galaxy`

        $ openstack domain create galaxy
        
3. Create a project `planet_jakku` in the domain `galaxy`

        $ openstack project create planet_jakku --domain galaxy
4. Create a user `rey` with password `starwars`

        $ openstack user create --project planet_jakku --domain galaxy --password starwars rey
5. Assign the admin role to user `rey` on project `planet_jakku`

        $ openstack role add --user rey --user-domain galaxy --project planet_jakku --project-domain galaxy admin
        $ openstack role list -- project planet_jakku --user rey

#### Task-2: Configure Horizon to Keystone v3

1. Find the file local_setting.py in dashboard directory. Commonly the path is
    * _/etc/openstack-dashboard/local_settings.py_ or
    * _/usr/share/openstack-dashboard/openstack_dashboard/local/local_settings.py_
2. Open _local_setting.py_ file

         $ sudo vi /etc/openstack-dashboard/local_settings.py
3. Enable the below options:
    * Update the option OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT to True
    
            OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT = True
    * Set the OpenStack API version to version 3
    
            OPENSTACK_API_VERSIONS = {
              " identity ": 3 ,
            }
    * Update the Keystone URL value to version v3
    
            OPENSTACK_KEYSTONE_URL = "http://%s:5000/v3" % OPENSTACK_HOST
4. Save and exit the file (press `Esc`, type `:wq` and `Enter`)
5. Restart the `apache2` server

#### Task-3: Login to Horizon
1. Open the browser and goto http://<opentack-ip>/horizon
2. Enter Domain `galaxy`, User Name `rey` and Password `starwars` and Click `Connect`
3. You should login successfully
