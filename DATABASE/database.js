 const mysql=require('mysql2');
//CONNECTING TO THE DB
const connection = mysql.createConnection({
    connectionLimit : 10,
    host            : 'sql8.freemysqlhosting.net',
    user            : 'sql8629674',
    password        : '9mzMguETRD',
    database        : 'sql8629674'
})
//CHECK CONNECTION
connection.connect(function(err) {
    if (err){
        console.error('error connecting ' + err.stack);
        return;
    }
    console.log('connected as [id ' + connection.threadId)
});
 module.exports=connection;