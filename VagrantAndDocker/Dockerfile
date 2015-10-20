FROM node:latest
RUN git clone https://github.com/ctarrington/NodeInDockerInVagrant.git /vagrant/nid
WORKDIR /vagrant/nid
RUN npm install
ENTRYPOINT node echo.js