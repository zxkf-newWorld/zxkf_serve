#创建数据库
DROP DATABASE IF EXISTS zxkf;
CREATE DATABASE zxkf CHARSET=UTF8;
#进入数据库
USE zxkf;
#创建用户信息表zxkf_login
CREATE TABLE zxkf_login
(
  uid int(11) PRIMARY AUTO_INCREMENT,
  uname varchar(32) DEFAULT NULL,
  upwd varchar(32) DEFAULT NULL,
  email varchar(64) DEFAULT NULL,
  phone varchar(16) DEFAULT NULL,
  avatar varchar(128) DEFAULT NULL,
  user_name varchar(32) DEFAULT NULL,
  gender tinyint(4) DEFAULT NULL
);
INSERT INTO zxkf_login VALUES(1,'tom','123','tom@163.com','13322224444','public/images/user/','天外飞仙',1);

#创建商品列表zxkf_product_list
CREATE TABLE zxkf_product_list(
    pid INT(11) PRIMARY KEY AUTO_INCREMENT,#租住房的id
    title TINYINT(4) ,#1：整租or 0：合租
    address CHAR(64),#出租地点
    price INT(6),#整租价格
    housesize CHAR(6),#房间面积
    floor CHAR(8),#楼层
    houselayout CHAR(10)#房间布局
);
UPDATE zxkf_product_list SET imgurl = "/public/images/";
INSERT INTO zxkf_product_list VALUES(
    NULL,1,"西安雁塔太白南路",9999,'999M²','32/40层','1室1厅1卫1厨'
);

#创建房屋信息表zxkf_product_details
CREATE TABLE zxkf_product_details(
    did INT(11) PRIMARY KEY AUTO_INCREMENT,#对应房屋详情id
    bed TINYINT(4),#双人床 1：拥有 0：不拥有
    closet TINYINT(4),#衣柜  1：拥有 0：不拥有
    writetable TINYINT(4),#写字台  1：拥有 0：不拥有
    sofa TINYINT(4),#沙发  1：拥有 0：不拥有
    tv TINYINT(4),#电视  1：拥有 0：不拥有
    kitchen TINYINT(4),#厨房  1：拥有 0：不拥有
    toilet TINYINT(4),#坐式马桶  1：拥有 0：不拥有
    aircondition TINYINT(4),#空调  1：拥有 0：不拥有
    onlyrestroom TINYINT(4),#独卫  1：拥有 0：不拥有
    notfirstfloor TINYINT(4),#非一楼  1：拥有 0：不拥有
    refrigerator TINYINT(4),#冰箱  1：拥有 0：不拥有
    nearsubway TINYINT(4),#近地铁  1：拥有 0：不拥有
    elevatorrome TINYINT(4),#电梯房  1：拥有 0：不拥有
    fid INT(11),#对应商品列表的房屋id
    FOREIGN KEY(fid) REFERENCES zxkf_product_list(pid)#fid 关联zxkf_product_list的房屋编号pid
);
#创建首页广告轮播图表
CREATE TABLE carousel(
    pid INT(11) PRIMARY KEY AUTO_INCREMENT,#轮播图片id
    purl VARCHAR(512)#轮播图路径
);
INSERT INTO carousel VALUES(NULL,'');

#推荐房源
CREATE TABLE recommend(
    rid INT(11) PRIMARY KEY AUTO_INCREMENT,#推荐房屋的id（排序）
    #定义两个外键
    userid INT(11),#当前浏览用户id
    plistid INT(11),#对应浏览商品列表的房屋id
    FOREIGN KEY(userid) REFERENCES zxkf_login(uid),#点击推荐房源的用户id
    FOREIGN KEY(plistid) REFERENCES zxkf_product_list(pid)#推荐房源所属的商品列表的房屋id
);
INSERT INTO recommend VALUES(1,1,1);
#收藏房源
CREATE TABLE collect(
    cid INT(11) PRIMARY KEY AUTO_INCREMENT,#收藏房屋的id（排序）
    #定义两个外键
    userid INT(11),#当前浏览用户id
    plistid INT(11),#对应浏览商品列表的房屋id
    FOREIGN KEY(userid) REFERENCES zxkf_login(uid),#点击推荐房源的用户id
    FOREIGN KEY(plistid) REFERENCES zxkf_product_list(pid)#推荐房源所属的商品列表的房屋id
);
INSERT INTO collect VALUES(1,1,1);
#预约房源
CREATE TABLE orderlist(
    oid INT(11) PRIMARY KEY AUTO_INCREMENT,#预约房屋的id（排序）
    #定义两个外键
    userid INT(11),#当前浏览用户id
    plistid INT(11),#对应浏览商品列表的房屋id
    FOREIGN KEY(userid) REFERENCES zxkf_login(uid),#点击推荐房源的用户id
    FOREIGN KEY(plistid) REFERENCES zxkf_product_list(pid)#推荐房源所属的商品列表的房屋id
);
INSERT INTO orderlist VALUES(1,1,1);