const express = require('express');
const ejs = require('ejs');
const axios = require('axios');
const bodyParser = require('body-parser');

// file esterni
const login = require('./controller/login');
const index = require('./controller/index');
const account = require('./controller/account');
const accountInfo = require('./controller/accountInfo');
const info = require('./controller/info');
const personalInfo = require('./controller/personalInfo');
const play = require('./controller/play');
const readWrite = require('./controller/readWrite');
const shop = require('./controller/shop');
const signIn = require('./controller/signIn');

const app = express();

// rouing
app.use('/login', login);
app.use('/index', index);
app.use('/account', account);
app.use('/accountInfo', accountInfo);
app.use('/info', info);
app.use('/personalInfo', personalInfo);
app.use('/play', play);
app.use('/readWrite', readWrite);
app.use('/shop', shop);
app.use('/signIn', signIn);

// settaggio
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.set('view engine', 'ejs');
app.use(express.static(__dirname + '/public'));

module.exports = app;