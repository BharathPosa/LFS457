###Exercise 8.5 Troubleshoot the issue 'Unable to ssh or ping instance'###

####Overview####

This exercise troubleshoots a ping/ssh issue to Nova instance from Host.
In this exercise, initially populate the environment variables; 'OS_USERNAME' with 'admin', 'OS_PROJECT_NAME' with 'admin' and 'OS_PASSWORD' with 'password'.

Then create a instance 'vm2' with the image 'cirros' and associate the network 'private2' by running the following commands:
*$ glance image-list*
*$ nova net-list*
*$ nova boot vm2 --image \<CIRROS_IMAGE_ID\> --flavor m1.tiny --nic net-id=\<PRIVATE2_ID\>*

Once the instance 'vm2' gets created, ping the IP address of 'vm2' from the Host.


**Task 1**: Ensure that required security groups are enabled to that project.

**Task 2**: Check the packet flow from public interface to bridged interface.

**Task 3**: Check the 'vm2' IP address is pinging from the router 'router1' namespace.
 
**Task 4**: Check the public network gateway is pinging from the router 'router1' namespace.

**Task 5**: Ensure that net.ipv4.ip_forward is set to 1

**Task 5**: Ensure the routing table is created for the network 'private2' with the gateway of public network.

**Task 6**: Check that neutron services are running on the correct host

**Task 7**: Reboot the host, if all of above steps are already correct.


**Required setup:**

1. Populate the environment variables; 'OS_USERNAME' with 'admin', 'OS_PROJECT_NAME' with 'admin' and 'OS_PASSWORD' with 'password'. 
2. Create a private network 'private2' with the subnet 'private2-subnet' with the cidr of '10.0.5.0/24'.
3. Add this network interface to the router 'router1'.


