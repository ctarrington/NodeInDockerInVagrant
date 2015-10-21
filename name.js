"use strict";

var express = require('express');
var app = express();
var bodyParser = require('body-parser');

app.use( bodyParser.json() );
app.use( bodyParser.urlencoded({ extended: true }) );

var names = ['fred', 'barney', 'wilma', 'betty'];
var nameIndex = 0;

var server = app.listen(3332, function () {

    app.get('/name', function(req, res) {
        res.send(names[nameIndex]);
        nameIndex++;
        nameIndex = nameIndex % names.length;
    });

    console.log('Dungeon Authentication listening at http://%s:%s', server.address().address, server.address().port);
});
