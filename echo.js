"use strict";

var express = require('express');
var app = express();
var bodyParser = require('body-parser');

var request = require('superagent');

app.use( bodyParser.json() );
app.use( bodyParser.urlencoded({ extended: true }) );

var ECHO_SVC_PORT = process.env.HWCONFIG_ECHO_SVC_PORT;
var NAME_SVC_HOST = process.env.HWCONFIG_NAME_SVC_HOST;
var NAME_SVC_PORT = process.env.HWCONFIG_NAME_SVC_PORT;

if (!ECHO_SVC_PORT || !NAME_SVC_HOST || !NAME_SVC_PORT) {
    var msg = 'missing an environment variable';
    console.log(msg);
    throw new Error(msg);
}

var server = app.listen(ECHO_SVC_PORT, function () {

    app.get('/echoQ', function(req, res) {


        request
            .get('http://'+NAME_SVC_HOST+':'+NAME_SVC_PORT+'/name')
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
