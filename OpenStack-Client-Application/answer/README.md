# Openstack Client Application

Exercise:
--------
Openstack Client Application
	This exercise will help you to build your own openstack client web based application with flask and openstack python client libraries.

### Instructions ###
- Download zip file from https://github.com/vedamsgit/LFS457/tree/openStack-client-application/OpenStack-Client-Application/question.zip?raw=true
- Unzip file and go inside into folder
- Run: python oca.py
- Open in browser: http://127.0.0.1:5000

##### Task1: #####
- List out all instances from your all in one Openstack liberty cloud using python-novaclient in instance page( http://127.0.0.1:5000 )
- Do required code changes in oca.py file under “def get_all_instances()”
- Set the variable ins_list equal to the value of instance list object.

##### Task2: ###
- List out all volumes from your all in one Openstack liberty cloud using python-cinderclient in volumes page page( http://127.0.0.1:5000/volumes )
- Do required code changes in oca.py file under “def get_all_volumes()”
- Set the variable vol_list equal to the value of volumes list object.

##### Task 3: ###
- Click on create volume button in volume list page, it will redirect to create volume page.
- Create a volume from ui and the volume should show in volumes list page ( http://127.0.0.1:5000/volumes ).
- Do required code changes in oca.py file under "def create_volume()"

##### Required setup: #####
- **All in one Openstack liberty setup should be installed with OpenStack Cinder on Ubuntu 14.04 LTS virtual machine.**
- **Below library should be installed on above virtual machine**
 - **flask**
 - **Python-cinderclient**
 - **Python-novaclient**
- **We will use v2.0 keystone authentication.**
