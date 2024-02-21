const express = require('express');
const ejs = require('ejs');
const axios = require('axios');
const bodyParser = require('body-parser');

// file esterni
//const login = require('./controller/login');
const index = require('./controller/index');
const user = require('./controller/user');
const info = require('./controller/info');
const play = require('./controller/play');
//const signIn = require('./controller/signIn');

const app = express();

// rouing
//app.use('/login', login);
app.use('/index', index);
app.use('/user', user);
app.use('/info', info);
app.use('/play', play);
//app.use('/signIn', signIn);

// settaggio
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.set('view engine', 'ejs');
app.use(express.static(__dirname + '/public'));

module.exports = app;