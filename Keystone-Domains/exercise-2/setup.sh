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
echo "Creating domain marvel"
openstack domain create marvel
echo "Creating user 'hulk' with password 'greenhulk'"
openstack user create --domain=marvel --password=greenhulk hulk
echo "Assigning admin role to user 'hulk' on domain 'marvel'"
openstack role add --user=hulk --domain=marvel admin
echo "Verifying role of 'hulk' on domain 'marvel'"
openstack role list --user=hulk --domain=marvel
echo ""

# preparing marvel domain
echo "Creating domain dc"
openstack domain create dc
echo "Creating user 'arrow' with password 'greenarrow'"
openstack user create --domain=dc --password=greenhulk arrow
echo "Assigning admin role to user 'arrow' on domain 'dc'"
openstack role add --user=arrow --domain=dc admin
echo "Verifying role of 'arrow' on domain 'dc'"
openstack role list --user=arrow --domain=dc
echo ""


# Save the domain IDs
linux_id=$(openstack domain show linux | grep -w id | awk '{print $4}')
marvel_id=$(openstack domain show marvel | grep -w id | awk '{print $4}')
dc_id=$(openstack domain show dc | grep -w id | awk '{print $4}')

echo "linux domain ID: $linux_id" > domain-ids.txt
echo "marvel domain ID: $marvel_id" >> domain-ids.txt
echo "dc domain ID: $dc_id" >> domain-ids.txt

echo "Saved domain IDs to domain-ids.txt, will use later"
echo ""
echo "linux domain ID: $linux_id"
echo "marvel domain ID: $marvel_id"
echo "dc domain ID: $dc_id"
