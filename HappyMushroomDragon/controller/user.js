
const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');
const router = express.Router();

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

// richieste
router.get("/", (req, res) => {
    res.render("pages/shop");
});

router.post("/compra", (req, res) => {
    var soldiDisponibili = req.body.Money; // query per ottenere le monete del giocatore
    var costoPngDaComprare = req.body.costoPngDaCommprare;

    if (parseInt(soldiDisponibili) > parseInt(costoPngDaComprare)) {
        res.send('PGN comprato, monete rimanenti ' + (soldiDisponibili - costoPngDaComprare).toString());
    }
    res.send('Monete insufficenti, ti mancano' + (costoPngDaComprare - soldiDisponibili).toString() + ' monete.');
});

router.post('/write', (req, res) => {
    connection.query('USE DB_HMD;');

    connection.query('SELECT TOP 10 * FROM Recensini;', 
    function (err, results) {
        if (err) {
            console.log(err);
            return;
        }
        res.send(results);
    });

    connection.end(function (err) {
        if (err) {
            console.log(err);
            return;
        }
    })
});

router.post('/read', (req, res) => {
    res.send('laskdjflsjk');
});

router.post('/getUser', (req, res) => {
    res.send('...')
});

// fine richieste

module.exports = router; 