// 引入相关文件
const express = require('express');
const router = express.Router();
const pool = require('../pool.js');

/*
 * 更新用户对应的搜索历史记录searchHistory
 * 更新未登录下对应的搜索历史记录
 */

// 相关接口
router.post('/updateSearchHistory', (req, res) => {
  let obj = req.body;
  console.log(obj ,'<<<<< 接收的更新的数据');
  let sql = 'SELECT * FROM zxkf_login WHERE phone = ?';
  pool.query(sql,[obj.phone], (err, result) => {
    if (err) {
      throw err;
    }
    if (result.length > 0) {
      let sql = `UPDATE zxkf_login SET searchHistory = ?  WHERE phone = ${obj.phone}`;
      pool.query(sql, [obj.searchHistory],(err, result) => {
        if (err) {
          throw err;
        }
        if (result.affectedRows > 0) {
          res.send({code: 1, msg: '搜索历史记录列表更新成功'});
        } else {
          res.send({code: 0, msg: '搜索历史记录列表更新失败'});
        }
      });
    } else {
      res.send({code: 0, msg: `未查找到${obj.phone}用户`});
    }
  });

});
// 查找用户搜索历史记录接口
router.get('/userSearchHistory', (req, res) => {
  let obj = req.query;
  console.log(obj, '<<<<< req.query');
  let sql = `SELECT * FROM zxkf_login WHERE phone = ?`;
  pool.query(sql, [obj.phone], (err, result) => {
    if(err) throw err;
    if (result.length > 0) {
      // 查询成功
      res.send({code: 1, res: result[0].searchHistory /* 用户对应的搜索历史记录 */, msg: '用户搜素历史列表信息查询成功'});
    } else {
      res.send({code: 0, msg: '用户搜素历史列表信息查询失败'});
    }
  });
});

// 导出
module.exports = router;
