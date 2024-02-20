
const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');
const router = express.Router();

router.use(bodyParser.urlencoded({extended: true}));
router.use(bodyParser.json());

// richieste
router.get("/", (req, res) => {
    res.render("pages/shop");
});

router.post("/compra", (req, res) => {
    var soldiDisponibili = req.body.Money; // query per ottenere le monete del giocatore
    var costoPngDaComprare = req.body.costoPngDaCommprare;

    if (parseInt(soldiDisponibili) > parseInt(costoPngDaComprare)){
        res.send('PGN comprato, monete rimanenti ' + (soldiDisponibili - costoPngDaComprare).toString());
    }
    res.send('Monete insufficenti, ti mancano' + (costoPngDaComprare - soldiDisponibili).toString() + ' monete.');
});
// fine richieste

module.exports = router; 