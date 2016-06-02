
Keystone-Domains Lab --> Exercise 4.2 --> Task 3 --> TEST-1 
Here we need to create file with the name "domain-scope.json" and the curl command incorrectly has the file name as "domain-scoped.json".

Heat-Advanced-Concepts Lab --> Exercise 12.1 -->  Task 1 
In "cloud_config.yaml" user should modify image name and network ID.

Heat-Advanced-Concepts Lab --> Exercise 12.1 --> Task 3
"ssh -i heat_key.pem ubuntu@172.16.5.7" command giving ssh: connect to host 172.16.5.7 port 22: No route to host

The-OpenStack-API-Model Lab --> Exercise 16.1 --> Task 1
TOKEN=$(curl -si -H"Content-Type: application/json" \
     -d @user-credentials.json http://127.0.0.1:5000/v3/auth/tokens \
     grep ^X-Subject-Token: | awk '{print $2}')
In the above command | symbol is missed before grep.

Write-An-OpenStack-Client-Application Lab --> Exercise 17.1 --> Instructions 
In 5th point, auth_url mentioned like http://HOST_IP:1234/v2.0 but it should be http://HOST_IP:35357/v2.0

Devstack Lab --> Exercise 18.2 --> Task 2 
Here Allocation pool range is wrong
Q_FLOATING_ALLOCATION_POOL=start=192.168.10.110,end=192.168.10.15
replace with Q_FLOATING_ALLOCATION_POOL=start=192.168.10.110,end=192.168.10.150
