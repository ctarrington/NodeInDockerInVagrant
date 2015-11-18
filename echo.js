"use strict";

var express = require('express');
var app = express();
var bodyParser = require('body-parser');

var request = require('superagent');

app.use( bodyParser.json() );
app.use( bodyParser.urlencoded({ extended: true }) );

var DISCOVERY_PORT = process.env.NID_CONFIG_DISCOVERY_PORT;
var PORT = process.env.PORT;

if (!DISCOVERY_PORT || !PORT) {
    var msg = 'missing an environment variable';
    console.log(msg);
    throw new Error(msg);
}

var server = app.listen(PORT, function () {

    app.get('/echoQ', function(req, res) {


        console.log('In /echoQ');
        var nameServiceUrl = 'http://name.ndv'+':'+DISCOVERY_PORT+'/name';
        console.log('nameServiceUrl: '+nameServiceUrl);

        request
            .get(nameServiceUrl)
            .end(function(err, nameResponse) {
                var name = 'No name';

                if (err) {
                    console.log(err);
                }
                else {
                    name = nameResponse.text;
                }

                res.send('NID_RESOUCE_HOST: '+process.env.NID_RESOUCE_HOST+ ' hi! q = ' +req.query.q+' name = '+name );

            });
    });

    console.log('Echo Service listening at http://%s:%s', server.address().address, server.address().port);
});
