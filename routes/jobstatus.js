const express = require('express')
const bodyParser = require('body-parser')   //to pass json data
const mysql = require('mysql2')

const app = express()
const connection = require ('../DATABASE/database')
//*****************************REPORT*************************************** */
//GET DATA
app.get('/jobstatus', (req,res) => {
    let sql = `SELECT * FROM jobstatus`
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
app.get('/jobstatus/:id', (req,res) => {
    let sql = `SELECT * FROM jobstatus WHERE jobstatus_id ='${req.params.id}' `
    connection.query(sql, [req.params.id], (err,results)=>{
        if(err) throw err
        else{
            res.send(results).status(200)
        }
    })
})
//update DATA
app.put('/jobstatus/:id', (req,res) => {
    //data destructuring
    const jobstatus_id = req.params.id;
    const jobstatus = req.body.jobstatus;

    let sql = `UPDATE jobstatus SET jobstatus=? WHERE jobstatus_id ='${req.params.id}'`
    connection.query(sql, [jobstatus, jobstatus_id], (err, results)=>{
        if(err) throw err
        else{
            res.send("UPDATED")
        }
    })
})
module.exports = app;