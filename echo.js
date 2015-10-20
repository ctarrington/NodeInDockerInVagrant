"use strict";

var express = require('express');
var app = express();
var bodyParser = require('body-parser');

app.use( bodyParser.json() );
app.use( bodyParser.urlencoded({ extended: true }) );

var server = app.listen(3666, function () {

    app.get('/echoQ', function(req, res) {
        res.send(req.query.q);
    });

    console.log('Dungeon Authentication listening at http://%s:%s', server.address().address, server.address().port);
});
