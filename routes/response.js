const express = require('express')
const bodyParser = require('body-parser')   //used by xampp to pass json data
const mysql = require('mysql2')

const app = express()
const connection = require ('../DATABASE/database')
//*****************************RESPONSE************************************ */
//GET DATA
//View by artisan
app.get('/get_response', (req,res) => {
    let sql = `SELECT * FROM response`
    connection.query(sql,(err,results)=>{
        if(err)
        {
            console.log(err,'errs');
        }
        if(results.length>0)
        {
            res.send({
                message:'View list of requests',
                data:results
            })
        }
    })
})
//GET DATA BY ID
//View by artisan
app.get('/get_response/:id', (req,res) => {
    let sql = `SELECT * FROM response WHERE responce_id ='${req.params.id}' `
    connection.query(sql, [req.params.id], (err,results)=>{
        if(err) throw err
        else{
            res.send(results).status(200)
        }
    })
})
//ADD DATA
app.post('/post_response', (req,res) => {
    const params = req.body //get data

    let sql = `INSERT INTO response VALUES (NULL, '${req.body.jobcard_id}', '${req.body.artisan_name}',
                                        '${req.body.ETC}')`;
    console.log(sql);

    connection.query(sql, params, (err, results)=>{
        if(err) throw err
        else{
            res.send( `Record ${params.responce_id} has been added`).status(200)
        }
        console.log(req.body)
    })
})
module.exports = app;