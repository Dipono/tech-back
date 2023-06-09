const express = require('express')
const bodyParser = require('body-parser')   //used by xampp to pass json data
const mysql = require('mysql2')

const router = express.Router()
const connection = require('../DATABASE/database')

//*****************************REPORT*************************************** */
//GET DATA
router.get('/report', (req,res) => {
    let sql = `SELECT *
                from report rep`
                //and job_status <> ""
                // and artisanNo =?
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
router.get('/report/:id', (req,res) => {
    let sql = `SELECT * FROM report WHERE report_id ='${req.params.id}' `
    connection.query(sql, [req.params.id], (err,results)=>{
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
//ADD DATA
router.post('/report', (req,res) => {
    let sql = `INSERT into report(job_status, jobcardId)
                VALUES("pending",3)`
    let status = "pending"
    connection.query(sql,[status, req.body.jobcardId], (err, results)=>{
        if(err) throw err
        else{
            res.send({success:true, results})
        }
    })
})
//update DATA
router.put('/update_status/:id', (req,res) => {
    console.log(req.body.job_status, req.params.id, req.body.jobcardId)

    let sql = `UPDATE report
                Set job_status = ?
                WHERE reportId =?
                AND jobcardId =?`
    connection.query(sql, [req.body.job_status, req.params.id, req.body.jobcardId], (err, results)=> {
        if(err) throw err
        else{
            res.send({message:"status updated", results})
        }
    })
})

//DELETE DATA
router.delete('/deletereport/:id', (req,res) => {
    let sql = `DELETE FROM report WHERE report_id ='${req.params.id}' `
    connection.query(sql, [req.params.id], (err,results)=>{
        if(err) throw err
        else{
            res.send(`RECORD '${req.params.id}' HAS BEEN DELETED`).status(200)
        }
    })
})
module.exports = router;