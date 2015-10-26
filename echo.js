"use strict";

var express = require('express');
var app = express();
var bodyParser = require('body-parser');

var request = require('superagent');

app.use( bodyParser.json() );
app.use( bodyParser.urlencoded({ extended: true }) );

var SERVICE_HOST = (process.env.DOCKER_HOST) || 'localhost';
console.log('SERVICE_HOST = '+SERVICE_HOST);

var server = app.listen(3331, function () {

    app.get('/echoQ', function(req, res) {


        request
            .get('http://'+SERVICE_HOST+':3332/name')
            .end(function(err, nameResponse) {
                var name = 'No name';

                if (err) {
                    console.log(err);
                }
                else {
                    name = nameResponse.text;
                }

                res.send('hi! q = ' +req.query.q+' name = '+name );

            });
    });

    console.log('Echo Service listening at http://%s:%s', server.address().address, server.address().port);
});
