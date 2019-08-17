const express = require("express");
const router = express.Router();
// 引入数据库池
const pool = require("../pool.js");


// 1:整租功能接口
// 通过单击整租按钮，进入房屋信息列表
router.get("/fullrent",(req,res)=>{
    var obj = req.query;
    // 查询是整租的房屋信息列表
    let rentType = obj.renttype;//租住类型
    let cityBelong = obj.citybelong;//房屋所在城市
    const sql = " SELECT * FROM zxkf_product_list WHERE renttype = ? AND citybelong = ?";
    pool.query(sql,[rentType,cityBelong],(err,result)=>{
        console.log("已经开始查询数据库了");
        if(err) throw err;
        // console.log(result.affectedRows);
        console.log(result);
    });
});
// 导出路由
module.exports = router;