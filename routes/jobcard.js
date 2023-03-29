const express = require('express')
const bodyParser = require('body-parser')   //used by xampp to pass json data
const mysql = require('mysql2')

const router = express.Router()
const connection = require('../DATABASE/database')
//*****************************JOB CARD************************************ */
//GET DATA AACORDING TO MY LOCATION
router.get('/jobcard', (req, res) => {
    let sql = `SELECT jobcardId, referenceNo, vanue, category, description, date_created, date_to_fix, time, image, job.artisanId, art.firstname as aFirstname, art.lastname as aLastname, sta.staffNo, sta.firstname as sFirstname, sta.lastname as sLastname
    FROM jobcard job, artisan art, staff sta
    where sta.staffId = job.staffId
    and job.artisanId = art.artisanId`

    connection.query(sql,[], (err, results) => {
        if (err) {
            console.log(err, 'errs');
        }
        if (results.length > 0) {
            res.send({
                message: 'View list of requests',
                data: results,
                success:true
            })
        }
        else{
            res.send({
                message:"No requests have been made",
                success:false
            })
        }
    })
})

router.put('/update_artisan/:jobId', (req,res)=>{

    let sql = `UPDATE jobcard 
                set artisanId = ?
                WHERE jobcardId = ?`

    connection.query(sql, [req.body.artisanId, req.params.jobId], (err,results)=>{
        if(err) throw err
        res.send({success:true, results})
    })

})
//GET DATA BY ID
router.get('/jobcard/:id', (req, res) => {
    let sql = `SELECT * FROM jobcard WHERE jobcard_id ='${req.params.id}' `
    connection.query(sql, [req.params.id], (err, results) => {
        if (err) throw err
        else {
            res.send(results).status(200)
        }
    })
})

//ADD DATA
router.post('/jobcard', (req, res) => {
    const params = req.body //get data
    let reference = Date.now();
    let todayDate = new Date().toLocaleDateString({
        hour12: false
    })
    
    let checkStaffNo = `select * from staff where staffNo =?`
    connection.query(checkStaffNo, params.staffNo, (err, rows) => {
        if (err) return err
        if (rows.length < 1) {
            res.send({ message: "The staff number does not exist", success: false })
            console.log({ message: "The staff number does not exist", success: false })
            return;
        }
        else {
            let staffId = rows[0].staffId;
            let artisanId = 1;

            let sql = `insert into jobcard(referenceNo, vanue, category, description,date_created, date_to_fix, time, image, staffId, artisanId)
            VALUES(?,?,?,?,?,?,?,?,?,?)`;
            let paramsValue = [reference, params.vanue, params.category, params.description, todayDate, params.date_to_fix, params.time, params.image, staffId, artisanId];
            

            connection.query(sql, paramsValue, (err, results) => {
                if (err) throw err
                else {
                    res.send({ results, message: "Successfully send job card", success: true })
                    console.log({ results, message: "Successfully send job card", success: true })

                }
            })
        }
    })
    //let image = "image.png"

})

//DELETE DATA
router.delete('/jobcard/:id', (req, res) => {
    let sql = `DELETE FROM jobcard WHERE jobcard_id ='${req.params.id}' `
    connection.query(sql, [req.params.id], (err, results) => {
        if (err) throw err
        else {
            res.send(`RECORD '${req.params.id}' HAS BEEN DELETED`).status(200)
        }
    })
})
module.exports = router;