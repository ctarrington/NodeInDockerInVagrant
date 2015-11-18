"use strict";

var express = require('express');
var app = express();
var bodyParser = require('body-parser');

app.use( bodyParser.json() );
app.use( bodyParser.urlencoded({ extended: true }) );

var names = ['fred', 'barney', 'wilma', 'betty'];
var nameIndex = 0;

var PORT = process.env.PORT;

if (!PORT) {
    var msg = 'missing an environment variable';
    console.log(msg);
    throw new Error(msg);
}

var server = app.listen(PORT, function () {

    app.get('/name', function(req, res) {

        console.log('In /name');
        res.send(names[nameIndex]);
        nameIndex++;
        nameIndex = nameIndex % names.length;
    });

    console.log('Name Service listening at http://%s:%s', server.address().address, server.address().port);
});
