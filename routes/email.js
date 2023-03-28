const express = require('express')
const bodyParser = require('body-parser')   //used by xampp to pass json data
const mysql = require('mysql2')

const app = express()
const connection = require ('../DATABASE/database')
//WORKING WITH EMAIL
const nodemailer = require("nodemailer");
/******************************************************************************** */
let mailTransport = nodemailer.createTransport({
    service: "outlook",
    auth: {
        user: "technicalservices101@outlook.com",
        pass: "@101Services"
    }
})

let details = {
    from: "technicalservices101@outlook.com",
    to: "banelempofu7979@gmail.com",
    subject: "Testing",
    text: "Testing my mailer",
}

mailTransport.sendMail(details, err => {
    if (err) {
        console.log("It has an error", err)
    }else {
        console.log("Email sent")
    }
})

module.exports = app;