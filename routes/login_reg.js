const express = require("express");
const router = express.Router();
const pool = require("../pool");
const multer = require("multer");
const path = require("path");
const gm = require('gm');
const fs = require('fs');
// 用户登录 : 手机号登录
router.post("/login", (req, res) => {
  console.log(req.body);
  // var uname=req.body.uname;
  // 获取账号: 手机号 ; 密码
  let phone = req.body.phone,
    upwd = req.body.upwd;
  // var upwd=req.body.upwd;
  var sql = "select * from zxkf_login  where phone=? and upwd=?";
  pool.query(sql, [phone, upwd], (err, result) => {
    if (err) console.log(err);
    console.log(result);
    if (result.length > 0) {
      res.send({ code: 1, msg: "用户已注册，登录成功" });
    } else {
      res.send({ code: 0, msg: "用户名或密码错误！" });
    }
  });
});
// 用户注册
router.post("/reg", function(req, res) {
  //获取post请求的数据
  let obj = req.body;
  console.log(obj, "<<<<< req.body");
  //执行SQL语句
  pool.query("INSERT INTO zxkf_login SET ?", [obj], function(err, result) {
    if (err) throw err;
    console.log(result);
    //判断是否插入成功
    if (result.affectedRows > 0) {
      res.send({ code: 200, msg: "reg success" });
    }
  });
});
// 用户头像上传
const upload = multer({ dest: "avatar/" });
router.post("/crop", upload.single("img"), (req, res) => {
  const file = req.file;
  const userPhone = req.body.userPhone;
  console.log(userPhone, '<<<<< userPhone');
  console.log(file, '<<<< file');
  const imgType = file.mimetype.slice(file.mimetype.indexOf('/') + 1); /*  image type */
  // console.log(imgType);
  // console.log(file, '<<<< file');
  const fileName = createPic() + `.${imgType}`; /* 头像图片文件命名 */
  // gm
  const imgPath = path.normalize(__dirname + `/../avatar/${file.filename}`);
  gm(imgPath)
  .resize(100, 100, '!')
  .write(path.normalize(__dirname + `/../avatar/${fileName}`), err => {
    if (!err) {
      console.log('image upload done');
    }
    fs.unlink(imgPath, (err) => {
      if(err) {
        throw err;
      }
      console.log('img is deleted');
      // 数据库操作, 将图片存储在数据表zxkf_login 的 字段avatar,即更新avatar
      // 打包替换地址
      // const imageUrl = `http://youthhouse.applinzi.com/`
      const imageUrl = `http://127.0.0.1:3000/`;
      const sql = `UPDATE zxkf_login SET avatar=? WHERE phone=${userPhone}`
      pool.query(sql, `${imageUrl}${fileName}` , (err, result) => {
        if (err) {
          throw err;
        }
        console.log(result, 'result');
        if (result.affectedRows > 0) {
          res.send({ code: 1, msg: 'avatar upload success', imgUrl: `${imageUrl}${fileName}`});
        } else {
          res.send({ code: -1, msg: 'avatar upload failed'});
        }
      });
    });
  });
  return;
});
function createPic() {
  let now = new Date(),
  year = now.getFullYear(), //得到年份
  month = now.getMonth(), //得到月份
  date = now.getDate(), //得到日期
  hour = now.getHours(), //得到小时
  minu = now.getMinutes(); //得到分钟
  month = month + 1;
  if (month < 10) month = '0' + month;
  if (date < 10) date = '0' + date;
  if (minu < 10) minu = '0' + minu;
  var number = now.getSeconds() % 43; //这将产生一个基于目前时间的0到42的整数。
  var time = year + month + date + hour + minu;
  return `${time}_${number}`;
}

module.exports = router;
