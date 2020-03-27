const express = require("express");
const router = express.Router();
// 引入数据库池
const pool = require("../pool.js");

let selectFuc = function(obj, res) {
  let sql =
    `SELECT * FROM zxkf_product_list WHERE title=` +
    obj.title +
    ` AND citybelong=?`;
  pool.query(sql, [obj.cityBelong], async (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      console.log(result.length, "<<<<< result.length查询到的数据条数");
      // 循环遍历result,查询每一个符合的房屋的信息
      for (let elem of result) {
        let sql1 = "SELECT * FROM zxkf_product_details WHERE fid=?";
        // 通过房屋列表对应的房屋id查询相关的房屋信息
        console.log(elem.pid, "<<<<<<<elem.pid");
        //创建功能函数的公共函数--数据库查询相关的操作
        var totalResult = {};
        //to对应的房屋列表+对应的详情
        var to = [];
        await pool.query(sql1, [elem.pid], function(err, result2) {
          console.log(result2, "<<<<<result2房屋相关信息");
          if (err) throw err;
          //只有拥有详情信息，才会在页面显示
          if (result2.length > 0) {
            console.log(result2[0], "<<<<< result[0]");
            // totalResult = totalResult.concat(result2);//将房屋信息整合一块:数组中有两条数据
            // 使用了es6语法：Object.assign合并对象赋值给新对象
            // var ele = Object.assign(totalResult,result2[0]);
            // console.log(ele,'<<<<< ele');
            // 避免刷新导致相同数据累加
            if (to.length <= 0) {
              to[to.length] = result2[0];
            } else {
              to.forEach(element => {
                console.log(element, "<<<<< 我是to的成员元素");
                for (const key in element) {
                  if (element.hasOwnProperty(key)) {
                    // const element = element[key];
                    if (key !== result2[0][key]) {
                      // 即存在不同的属性值
                      break;
                    }
                  }
                }
                to[to.length] = result2[0];
              });
            }
            console.log(to, "<<<<< to inside query");
          }
        });
      }
      // 使用计时器解决了pool.query异步任务的执行时间差，避免未获取到所需数据（可能由于延迟导致未获取到数据或者导致报错）
      setTimeout(function() {
        // console.log(to);
        // to[0]是zxkf_product_details房屋详细信息，
        // to[1]是zxkf_product_list房屋列表对应的房屋信息
        res.send({ code: 1, msg: "查询成功", dataArray: to });
      }, 1000);
    } else {
      // 数据查询失败，返回失败结果
      res.send({ code: 0, msg: "查询失败" });
    }
  });
};
// 1:整租功能接口
// 通过单击整租按钮，进入房屋信息列表 title:1
router.get("/fullrent", (req, res) => {
  let obj = req.query;
  console.log(obj, "<<<<< fullrent query");
  console.log(obj);
  if (obj) {
    // 调用公共的数据库查询函数
    selectFuc(obj, res);
  }
});
// 2:合租功能接口:以及猜我喜欢
// 通过单击合租按钮，进入房屋信息列表 title:0
router.get("/jointrent", (req, res) => {
  let obj = req.query;
  console.log(obj, "<<<<< joinrent query");
  console.log(obj);
  if (obj) {
    // 调用公共的数据库查询函数
    selectFuc(obj, res);
  }
});
// 3:品牌功能接口
// 通过单击品牌按钮，进入房屋信息列表 title:2
router.get("/pinpai", (req, res) => {
  let obj = req.query;
  console.log(obj);
  if (obj) {
    // 调用公共的数据库查询函数
    selectFuc(obj, res);
  }
});

// 2:找室友功能接口 title=3
router.get("/findRoomMates", (req, res) => {
  // 获取发送过来的数据
  // let obj = { title:req.query.title, cityBelong:req.query.cityBelong };
  // console.log(obj);
  // if(obj){
  //     // 调用公共的数据库查询函数
  //     selectFuc(obj,res);
  // }
  pool.query("select * from zxkf_roommate", (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", dataArray: result });
  });
});
// findRoomMatesDetails
router.get("/findRoomMatesDetails", (req, res) => {
  var rid = req.query.rid;
  pool.query(
    "select * from zxkf_roommate where rid=?",
    [rid],
    (err, result) => {
      if (err) throw err;
      res.send({ code: 1, msg: "查询成功", dataArray: result });
    }
  );
});
router.get("/tofunctions", (req, res) => {
  // 相关数据库操作
  res.send({ code: 1, msg: "查询成功" });
});
// 查找用户头像
router.get("/searchUserAvatar", (req, res) => {
  let phone = req.query.phone; /* 用户手机号 */
  const sql = `SELECT * FROM zxkf_login WHERE phone=?`;
  pool.query(sql, phone, (err, result) => {
    if (err) {
      throw err;
    }
    if (result.length > 0) {
      console.log("用户查找成功");
      res.send({ code: 1, msg: "user finded", avatar: result[0].avatar });
    } else {
      res.send({ code: -1, msg: "user unfinded" });
    }
  });
});
module.exports = router;
