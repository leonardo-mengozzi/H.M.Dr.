const express = require('express')
const cors = require('cors')
const server = express()

// Parse json request body
server.use(express.json());

// Enable cors
server.use(cors());
server.options('*', cors());

// The router that contains all posts routes
const postRouter = require('./router/v1/post')

// Init posts router on Express
server.use('/api/v1', postRouter)

const PORT = 3001;
server.listen(PORT, () => console.log("Service H.M.D. online at port: " + PORT));