const express = require('express');
const router = express.Router();
const connection = require('../DATABASE/database') //db connection
const { signupValidation } = require('./validation'); //validation file
const { validationResult } = require('express-validator'); //I dont understand
const bcrypt = require('bcryptjs'); //?
const jwt = require('jsonwebtoken'); //tokens for

//----
const mysql = require('mysql');
const app = express()
//---
/*
router.post('/register', signupValidation, (req, res,) => {
  connection.query(`SELECT * FROM users WHERE email_address ='${req.body.email_address}'`, [req.body.email_address], (err, result) => {

    console.log(result)

    if (result.length) {
      return res.status(409).send({
        msg: 'This user is already in use!'
      });
    } else {
      // username is available
      bcrypt.hash(req.body.password, 10, (err, hash) => {
        if (err) {
          return res.status(500).send({
            msg: err
          });
        } else {
          // has hashed pw => add to database
          connection.query(
            `INSERT INTO users (name, surname, contact, email_address, password, venue, department_id) VALUES ('${req.body.name}','${req.body.surname}','${req.body.contact}',
                '${req.body.email_address}','${req.body.password}', 
                '${req.body.venue}','${req.body.department_id}')`,
            (err, result) => {
              if (err) {
                throw err;
                return res.status(400).send({
                  msg: err
                });
              }
              return res.status(201).send({
                msg: 'The user has been registerd with us!'
              });
            }
          );
        }
      });
    }
  }
  );
});*/

router.post('/register', (req, res,) => {
  var params = req.body
  if (params.type === "admin") {
                  var sqlCheck = `SELECT *
                  from admin
                  where adminNo = ?
                  or email = ?`
    connection.query(sql,[params.adminNo,params.email])
  }

  else if (req.body.type === "artisan") {

  }

  else {

  }
  connection.query(`SELECT * FROM users WHERE email_address ='${req.body.email_address}'`, [req.body.email_address], (err, result) => {

    console.log(result)

    if (result.length) {
      return res.status(409).send({
        msg: 'This user is already in use!'
      });
    } else {
      // username is available
      bcrypt.hash(req.body.password, 10, (err, hash) => {
        if (err) {
          return res.status(500).send({
            msg: err
          });
        } else {
          // has hashed pw => add to database
          connection.query(
            `INSERT INTO users (name, surname, contact, email_address, password, venue, department_id) VALUES ('${req.body.name}','${req.body.surname}','${req.body.contact}',
                '${req.body.email_address}','${req.body.password}', 
                '${req.body.venue}','${req.body.department_id}')`,
            (err, result) => {
              if (err) {
                throw err;
                return res.status(400).send({
                  msg: err
                });
              }
              return res.status(201).send({
                msg: 'The user has been registerd with us!'
              });
            }
          );
        }
      });
    }
  }
  );
});

router.post('/login', (req, res) => {
  console.log(req.body.admin_email)
  var success = false
  var sql = `select * 
              from admin
              where admin_email =?`;
  connection.query(sql, req.body.admin_email, (err, results) => {
    if (err) return console.log(err)
    if (results.length > 0) {
      if (results[0].password === req.body.password) {
        res.send({ results, success: true });
      }
      else {
        res.send({ message: "Wrong email or password", success })
      }
    }
    else {
      res.send({ message: "Wrong email or password", success })

    }

  })
})


module.exports = router;
