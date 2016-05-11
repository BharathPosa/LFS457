#!/bin/bash

# Cleaning linux domain
echo "Deleting domain linux"
openstack domain set --disable linux
openstack domain delete linux

# Cleaning linux domain
echo "Deleting domain linux"
openstack domain set --disable marvel
openstack domain delete marvel

# Cleaning linux domain
echo "Deleting domain linux"
openstack domain set --disable dc
openstack domain delete dc
