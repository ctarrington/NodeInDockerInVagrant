# Goals
 - Vagrantfile and Dockerfile for node app
 - Pull from github
 - 

# Installation to Run Locally
npm install

node echo.js

# Build and Run in container(s)
 - commit and push repo
 - vagrant up
 - vagrant ssh
 - cd /vagrant
 - docker build -t nid .
 - docker run -d --name nid1 -p 3666:3666 nid
