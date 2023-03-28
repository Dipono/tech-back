const express = require('express')
const bodyParser = require('body-parser')   //to pass json data
const mysql = require('mysql2')
const cors = require ('cors')

const app = express() //app stores all the methods
const port = process.env.PORT || 3000 //for publishing app

//WORKING WITH AN IMAGE
const fs = require('fs')    //file system module
const multer = require('multer')

//ROUTES
const jobcard = require('./routes/jobcard')
const image = require('./routes/image')
// const email = require('./routes/email')
//const registration = require('./routes/registration')
const response = require('./routes/response')
const jobstatus = require('./routes/jobstatus')
const report = require('./routes/report')

app.use(bodyParser.urlencoded({ extended: false})) //ensure xampp is using the body parser
app.use(bodyParser.json())
app.use(cors({origin:"*"}))
app.use('/',jobcard)
app.use('/',image)
// app.use('/',email)
app.use('/',require('./routes/registration'))
app.use('/',require('./routes/users'))
//app.use('/',registration)
app.use('/',response)
app.use('/', jobstatus)
app.use('/', report)

app.use('/', (req, res)=>{
res.json('Endpoint')
})

//Listen on environment port or 3000
app.listen(port, () => console.log(`Listen on port ${port}`))
