# Goals
 - Vagrantfile and Dockerfile for node app
 - Pull from github
 - 

# Installation to Run Locally
npm install

node echo.js
http://localhost:3666/echoQ?q=hi%20thereeee

# Build and Run in container(s)
 - commit and push repo
 - vagrant up
 - vagrant ssh
 - cd /vagrant
 - docker build -t nid .
 - docker run -d --name nid1 -p 3666:3666 nid
 - http://localhost:3333/echoQ?q=hi%20thereeee
 
# Graceful Shutdown
 - docker stop nid1
 - docker rm nid1
 - exit to mac
 - vagrant halt
 
# completely clean
 - vagrant destroy
