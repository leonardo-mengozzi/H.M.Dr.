
const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');
const router = express.Router();

router.use(bodyParser.urlencoded({extended: true}));
router.use(bodyParser.json());

// liste di esempio di email e password contenute in un db come quello di firebase, andranno cancellate.
const acconuts = [['email1', 'pass1'],['email2', 'pass2']];

// richieste
router.get("/", (req, res) => {
    res.render("pages/signIn");
});

router.post("/", (req, res) => {
    var email = req.body.email;
    var password = req.body.password;

    // fare richiesta esterna che si connette a fire base.
    acconuts.forEach(l => {
        if (l[0] == email && l[1] == password)
            res.send('Account già presente');
    });

    acconuts.push([email, password]);
    res.send('Nuovo account creato.');
})
// fine richieste

module.exports = router;