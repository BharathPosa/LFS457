#!/bin/bash

source ~/openrc

# create domain galaxy
openstack domain create galaxy

# create project `planet_jakku`
openstack project create planet_jakku --domain galaxy

# create user rey
openstack user create --project planet_jakku --domain galaxy --password starwars rey

# assign role admin to rey onplannet_jakku
openstack role add --user rey --user-domain galaxy --project planet_jakku --project-domain galaxy admin
openstack role list -- project planet_jakku --user rey


## TASK-2
sudo sed  -i.bkp '/OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT/a OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT = True' \
      /etc/openstack-dashboard/local_settings.py > /tmp/local_settings.py

