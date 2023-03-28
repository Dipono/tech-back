const express = require('express')
const bodyParser = require('body-parser')   //used by xampp to pass json data
const mysql = require('mysql2')

const router = express.Router()
const connection = require('../DATABASE/database')

router.get('/getArtisan', (req, res)=>{
    let sql = "select * from artisan where artisanId <> 1";
    connection.query(sql, (err,results)=>{
        if(err) console.log(err)
        else{
            if(results.length>0){
                res.send(results)
            }

        }
    })
})


module.exports = router;