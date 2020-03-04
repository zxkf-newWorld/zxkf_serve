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
// const pool = mysql.createPool(
//   {
//       host:"w.rdc.sae.sina.com.cn",
//       user:"w43l40ll2o",
//       password:"2k2j2x2i325wx00j5mzm0hz53j42zxmy312xlkji",
//       port:3306,
//       database:"app_youthhouse",
//       connectionLimit:15
//   }
// );
// 导出数据库池
module.exports = pool;
