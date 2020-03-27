# 修改https限制
# project.config.json ==> urlcheck: false 

# globalData 中的全局属性 可以相应的直接来修改，不需要通过this.setData({})来修改
```js
    globalData: {
        id : 1,
    }
    const app = getApp();
    app.globalData.id = 2; /* 可以直接修改 */
```

# app.json 中配置路由

# wx小程序中的跳转: navigateTo() 跳转到不包含Tab中的页面
 * 解决: 使用wx.switchTab()跳转到相关Tab页面 ： 缺陷： 不能够带参数 -- 解决： 借助全局变量的方式： app.参数= 值
