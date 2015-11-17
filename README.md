# Goals
Vagrantfile and Dockerfile for node apps    
Run some services locally and some in containers - control through nginx

# Key
    m> mac terminal
    v> vagrant terminal
    d> docker terminal

# Initial setup - add to /etc/hosts
    # node in docker in vagrant
    192.168.60.11 name.ndv
    192.168.60.11 echo.ndv

# Build and Run in containers
    m> vagrant up
    
# Test locally
    m> curl http://echo.ndv:8080/echoQ?q=hi%20thereeee
    m> curl http://name.ndv:8080/name
    
# Manual restart after changing code or config
    m> vagrant rsync
    m> vagrant ssh
    v> cd /vagrant
    v> sudo ./restart_all.sh
    
# Restart nginx after changing config
    m> vagrant rsync
    m> vagrant ssh
    v> cd /vagrant
    v> sudo ./stop_nginx.sh & sudo ./start_nginx.sh
     
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
    m> PORT=4330 NID_CONFIG_DISCOVERY_PORT=8080 node echo.js
    m> PORT=4332 COLOR=RED node name.js

