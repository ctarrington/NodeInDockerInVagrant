# Goals
Vagrantfile and Dockerfile for node apps    
Run some services locally and some in containers - control through nginx    

# Approach
There are two identical Vagrant VMs, each running an identical cluster    
Each service runs in a Docker container and an nginx reverse proxy runs in another.

      
Services locate one another by name, with all hosts mapped to the nginx reverse proxy.    
A generated nginx config maps requests to actual services running on ports   
 
You have to update the /etc/hosts file on your Host so your browser can find nginx    

If you want to run a service locally, you have to change the nginx config so the upstream points to your development instance.    
You also need to add additional entries to /etc/hosts on your Host so the development instance can find nginx with <service>.ndv.here    


# Key
    m> mac terminal
    v> vagrant terminal
    d> docker terminal

# Pre-requisites
    vagrant and VM provider such as VirtualBox or VMWare or Parallels. Tested with VirtualBox on a Mac
    

# Initial setup - add to /etc/hosts 
    # send cluster 1 service requests to nginx
    192.168.60.11 name.ndv.c1
    192.168.60.11 echo.ndv.c1
    
    # send local requests to nginx. used if when a local service needs to find another service
    192.168.60.11 name.ndv.here
    192.168.60.11 echo.ndv.here
    
    # send cluster 2 service requests to nginx
    192.168.60.12 name.ndv.c2
    192.168.60.12 echo.ndv.c2

# Build and Run in containers
    m> vagrant up
    
# Test locally
    m> curl http://echo.ndv.c1:8080/echoQ?q=hi%20thereeee
    m> curl http://name.ndv.c1:8080/name
    
# Manual restart after changing code or config
    m> edit restart_all.sh with new service allocations
    m> vagrant rsync
    m> vagrant ssh nid-cluster1
    v> cd /vagrant
    v> sudo ./restart_all.sh
    
    Note: This will overwrite any edits to the generated_nginx.conf
     
# Completely clean
    m> vagrant destroy
 
# Handy commands
    v> docker logs <containerName>
    v> docker run -i -t --entrypoint /bin/bash <imageName>
    v> docker images
    v> docker ps -a

    v> docker rm -f $(docker ps -a -q)
    v> docker rmi $(docker images -q)

#Run locally 
    Change nginx.conf to point to local service(s) and restart nginx as above
    m> vagrant ssh nid-cluster1
    v> cd /vagrant
    v> vi generated_nginx.conf
    swap comments for the upstream echo service and one of the name services
    v> sudo ./stop_nginx.sh
    v> sudo ./start_nginx.sh
    m> npm install
    m> PORT=4332 NID_CONFIG_DISCOVERY_PORT=8080 node echo.js
    Try running curl http://echo.ndv.c1:8080/echoQ?q=hi%20thereeee
    Note that it always works even though the local development name service is not running.
    nginx routes traffic to the working service
    
    m> PORT=4330 NID_CONFIG_DISCOVERY_PORT=8080 node name.js
    When you hit the echo service all requests should go to your local echo service and half to the local name service
    
    

