// 创建数据库连接池
const mysql = require("mysql");
const pool = mysql.createPool(
    {
        host:"127.0.0.1",
        user:"root",
        password:"",
        port:3306,
        database:"zxkf",
        connectionLimit:15
    }
);
// 导出数据库池
module.exports = pool;