
const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');
const sql = require('mssql/msnodesqlv8');
const router = express.Router();

// var confing = {
//     server : "LAPTOP-K7QM0HU5\SQLEXPRESS",
//     database : "Db_HMD",
//     driver : "msnodesqlv8",
//     user : "MengoProve",
//     password : "1234",
//     options : {
//         trustedConnection : true
//     }
// }

var confing = {
    Server : "LAPTOP-K7QM0HU5\SQLEXPRESS",
    Database : "Db_HMD",
    UserId : "MengoProve",
    Password : "1234",
    Crittografa: true
}

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
    // async () => {
    //     sql.connect(confing, (err) => {
    //         if (err) res.send("errore1");
    
    //         var request = new sql.Request();
    //         request.query("select * Recensione;", (err, records) => {
    //             if (err) res.send("errore2");
    //             res.send(records);
    
    //         });
    //     });
    // }

    try {
        // make sure that any items are correctly URL encoded in the connection string
        sql.connect(confing)
        const result = sql.query`select * Recensione;`
        console.dir(result)
    } catch (err) {
        res.send(err);
    }
});

router.post('/getUser', (req, res) => {
    res.send('...')
});

// fine richieste

module.exports = router; 