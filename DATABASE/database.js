 const mysql=require('mysql2');
//CONNECTING TO THE DB
const connection = mysql.createConnection({
    connectionLimit : 10,
    host            : 'localhost',
    user            : 'root',
    password        : '',
    database        : 'technical-service'
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