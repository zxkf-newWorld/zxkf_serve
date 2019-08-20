const express = require("express");
const router = express.Router();
// 引入数据库池
const pool = require("../pool.js");


// 1:整租功能接口
// 通过单击整租按钮，进入房屋信息列表
router.get("/fullrent",(req,res)=>{
    let obj = req.query;
    let title = obj.title;
    let citybelong = obj.cityBelong;
    console.log(obj);
    // SELECT * FROM zxkf_product_list WHERE title=0 AND citybelong="西安";
    let sql = `SELECT * FROM zxkf_product_list WHERE title=? AND citybelong=?`;
    pool.query(sql,[title,citybelong],(err,result)=>{
        console.log("已经开始查询数据库了");
        if(err) throw err;
        // console.log(result.affectedRows);
        console.log(result);
        if(result.length>0){
            res.send({code:1,msg:"查询成功",dataArray:result});
        }else{
            res.send({code:-1,msg:"数据不存在"})
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