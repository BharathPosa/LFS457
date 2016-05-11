#!/bin/bash

# Run this script before starting exercise 4.2

# Stop if any error occurs
set -e

# preparing linux domain
echo "Creating domain linux"
openstack domain create linux
echo "Creating user 'linux' with password 'debian'"
openstack user create --domain=linux --password=debian ubuntu
echo "Assigning admin role to user 'ubuntu' on domain 'linux'"
openstack role add --user=ubuntu --domain=linux admin
echo "Verifying role of 'ubuntu' on domain 'linux'"
openstack role list --user=ubuntu --domain=linux
echo ""

# preparing marvel domain
echo "Creating domain linux"
openstack domain create marvel
echo "Creating user 'linux' with password 'debian'"
openstack user create --domain=marvel --password=greenhulk hulk
echo "Assigning admin role to user 'ubuntu' on domain 'linux'"
openstack role add --user=hulk --domain=marvel admin
echo "Verifying role of 'ubuntu'"
openstack role list --user=hulk --domain=marvel
echo ""

# preparing marvel domain
echo "Creating domain dc"
openstack domain create dc
echo "Creating user 'arrow' with password 'greenarrow'"
openstack user create --domain=dc --password=greenhulk arrow
echo "Assigning admin role to user 'arrow' on domain 'dc'"
openstack role add --user=arrow --domain=dc admin
echo "Verifying role of 'arrow'"
openstack role list --user=arrow --domain=dc
echo ""
