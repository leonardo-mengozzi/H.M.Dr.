const express = require('express')
const router = express.Router()
const httpStatus = require('http-status')

const validate = require('../../middleware/validator')
const postValidator = require('../../validator/post')
const controller = require('../../controller/user')


// Example of middleware
router.use((req, res, next) => {
    console.log(`Route called: ${req.method} - ${req.originalUrl}`)
    next()
})

// Get a paginated list of posts
router.get('/posts', validate(postValidator.list), controller.list)

router.get("/read", validate(postValidator.list), controller.read)

module.exports = router