//  1:加载第三方模块
const express = require("express");
// const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session");
const bodyParser = require("body-parser");
const qs = require("querystring");
// 引入数据库池

const PORT = 8090;
//创建服务器
var server = express();
// 3：配置跨域模块
server.use(cors({
    // 允许跨域访问程序地址列表
    origin:["http://127.0.0.1:8090",
            "http://localhost:8090"
    ],
    credentials:true,//请求验证
}));
// 4：配置session模块
server.use(session({
    secret:"128位字符串",//安全字符串
    resave:true,//请求时更新数据
    saveUninitialized: true,//保存初始数据 
}));
//4.1：配置项目的静态目录
// 可以在地址后面添加所需资源（名称/或者public下的路径+资源名称）
server.use(express.static("public")); 

// 监听端口号3000
server.listen(PORT,()=>{
    console.log("Servere listening "+PORT+" ...");
});
// 相关接口的配置
// 功能1：完成用户登录操作
// 接口相关测试
// http://127.0.0.1:3000/接口名称（路径）
// server.get("/demo",(req,res)=>{
//     console.log("IN接口");
//     // 接口代码
//     console.log("OUT接口");
// });
// server.post('/reg',(req,res)=>{
//     console.log("已经进入了post请求");
//     var obj = req.body;
//     console.log(obj);
//     console.log(res);
//     console.log("vue 使用post接口发送的数据，接收的数据");
// });
// 引入相关的功能接口
const demo = require("./routes/demo.js");
const index = require("./routes/index.js");
// server.use("/demo",demo);
server.use("/index",index);