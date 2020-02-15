const express=require("express");
const router=express.Router();
const pool=require("../pool");
// 用户登录 : 手机号登录
router.post("/login",(req,res)=>{
  console.log(req.body);
  // var uname=req.body.uname;
  // 获取账号: 手机号 ; 密码
  let phone = req.body.phone,
    upwd = req.body.upwd;
  // var upwd=req.body.upwd;
  var sql="select * from zxkf_login  where phone=? and upwd=?";
  pool.query(sql,[phone,upwd],(err,result)=>{
    if(err) console.log(err);
    console.log(result);
    if(result.length > 0){
      // req.session.uanme=result[0]["uname"]
      res.send({code:1,msg:'用户已注册，登录成功'});
    }else{
      res.send({code:0,msg:"用户名或密码错误！"})
    }
  })
})
// router.get("/login_uname",(req,res)=>{
//     var uname=req.query.uname;
//     var sql="select * from zxkf_login  where uname=?";
//     pool.query(sql,[uname],(err,result)=>{
//         if(err) console.log(err);
//         console.log(result);
//         if(result.length==1){
//           res.send({ok:1});
//         }else{
//           res.send({ok:0,msg:"用户名不存在！"})
//         }
//       })
// })
// router.get("/login_phone",(req,res)=>{
//     var phone=req.query.phone;
//     var sql="select * from zxkf_login  where phone=?";
//     pool.query(sql,[phone],(err,result)=>{
//         if(err) console.log(err);
//         console.log(result);
//         if(result.length==1){
//           res.send({ok:1});
//         }else{
//           res.send({ok:0,msg:"手机号不存在！"})
//         }
//       })
//   })
// 用户注册
router.post('/reg',function(req,res){
    //获取post请求的数据
    let obj=req.body;
    console.log(obj, '<<<<< req.body');
    //执行SQL语句
    pool.query('INSERT INTO zxkf_login SET ?',[obj],function(err,result){
      if(err) throw err;
      console.log(result);
      //判断是否插入成功
      if(result.affectedRows>0){
        res.send({code:200,msg:'reg success'});
      }
    });
  });
module.exports=router;
