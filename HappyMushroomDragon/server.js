var server = require("./app");
var port = process.env.PORT || 3000;

var avvio = server.listen(port, ()=> {
    console.log('Server in ascolto sulla porta ' + port + " ...");
});