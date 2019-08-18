const express = require("express");
const router = express.Router();
// 引入数据库池
const pool = require("../pool.js");


// 1:整租功能接口
// 通过单击整租按钮，进入房屋信息列表
router.get("/fullrent",(req,res)=>{
    var obj = req.query;
    // 查询是整租的房屋信息列表
    // let rentType = obj.renttype;//租住类型
    let cityBelong = obj.citybelong;//房屋所在城市
    let title = obj.title=="合租"?0:1;
    console.log(title,cityBelong);
    // let cityBelong = "西安";
    const sql = " SELECT * FROM zxkf_product_list WHERE title = ? AND citybelong = ?";
    pool.query(sql,[title,cityBelong],(err,result)=>{
        console.log("已经开始查询数据库了");
        if(err) throw err;
        // console.log(result.affectedRows);
        console.log(result);
        if(result.length > 0){
            res.send({code:1,msg:"查询成功",dataArray:result});
        }
    });
});
// 首页猜你喜欢的商品列表的信息加载
// router.get("/guessLike",(req,res)=>{
//     let obj = req.query;
//     console.log(obj);
//     let title = (obj.title=="合租"?0:1);
//     let cityBelong = obj.citybelong;

//     let sql = "SELECT * FROM zxkf_product_list WHERE title=? AND citybelong=?";
//     // 查询符合条件的商品列表
//     pool.query(sql,(err,result)=>{
//         if(err) throw err;
//         if(result.length >0){//查询到商品列表
//             console.log(result);

//             // res.send({code:1,msg:"查询到存在相关房屋",dataArray:result});
//         }
//     });

    


//     // 测试：
//     console.log(title,cityBelong);
// });
// 导出路由
module.exports = router;