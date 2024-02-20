
const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');
const router = express.Router();

router.use(bodyParser.urlencoded({extended: true}));
router.use(bodyParser.json());

router.get("/", (req, res) => {
    res.render("pages/login");
});

router.post("/", (req, res)=> {

    // fare che il controllo lo fa con fairbase.
    
    const email = req.body.email;
    const password = req.body.password;
    console.log(email + " " + password);
    res.send("Email: " + email + ", Password: " + password);

});

module.exports = router;