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
 - docker build --file Dockerfile.echo -t echoImage .
 - docker build --file Dockerfile.name -t nameImage .
 - docker run -d --name echoContainer -p 3331:3331 echo
 - docker run -d --name nameContainer -p 3331:3331 name
 - http://localhost:3333/echoQ?q=hi%20thereeee
 
# Graceful Shutdown
 - docker stop echoContainer
 - docker rm echoContainer
 - exit to mac
 - vagrant halt
 
# completely clean
 - vagrant destroy
