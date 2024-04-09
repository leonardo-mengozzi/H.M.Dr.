
const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');
const router = express.Router();

router.use(bodyParser.urlencoded({extended: true}));
router.use(bodyParser.json());

// richieste
router.get("/", (req, res) => {
    res.render("pages/index");
});

// fine richieste

module.exports = router;