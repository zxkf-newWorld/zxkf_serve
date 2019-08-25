const express = require("express");
const router = express.Router();
// 引入数据库池
const pool = require("../pool.js");
//创建功能函数的公共函数--数据库查询相关的操作
let selectFuc = function(obj,res){
    let sql = `SELECT * FROM zxkf_product_list WHERE title=`+obj.title+` AND citybelong=?`;
    pool.query(sql,[obj.cityBelong],(err,result)=>{
        if(err) throw err;
        if(result.length > 0){
            // 循环遍历result,查询每一个符合的房屋的信息
            var totalResult = [];
            for (let elem of result) {
                let sql1 = "SELECT * FROM zxkf_product_details WHERE fid=?"
                // 通过房屋列表对应的房屋id查询相关的房屋信息
                pool.query(sql1,[elem.pid],(err,result2)=>{
                    if(err) throw err;
                    if(result2.length > 0){
                        // console.log(result2[0]);
                        totalResult = result2.concat(elem);
                        console.log(totalResult);
                        // 对应房屋详情信息查询成功
                        // totalResult = totalResult.concat(result2);//将房屋信息整合一块:数组中有两条数据
                    }
                });
            }
            // console.log(totalResult);
            // console.log(totalResult.length);
            // totalResult[0]是zxkf_product_details房屋详细信息，
            // totalResult[1]是zxkf_product_list房屋列表对应的房屋信息
            res.send({code:1,msg:"查询成功",dataArray:totalResult});
        }else{
            // 数据查询失败，返回失败结果
            res.send({code:0,msg:"查询失败"});
        }
    });
}
// 1:整租功能接口
// 通过单击整租按钮，进入房屋信息列表
router.get("/fullrent",(req,res)=>{
    let obj = req.query;
    console.log(obj);
    if(obj){
        selectFuc(obj,res);
    }
});

// 2:找室友功能接口 title=3
router.get("/findRoomMates",(req,res)=>{
    // 获取发送过来的数据
    let obj = { title:req.query.title, cityBelong:req.query.cityBelong };
    console.log(obj);
    if(obj){
        // 查询数据库
        selectFuc(obj,res);
    }
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