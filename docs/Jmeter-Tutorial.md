## 一、项目练习总体信息
### 1. 用 Swagger官方的PetStore作为练习项目
*   github项目链接：<https://github.com/swagger-api/swagger-petstore>
*   Swagger 请求链接：<https://petstore3.swagger.io/>
*   swagger带yaml spec的链接：[链接](https://editor.swagger.io/?_gl=1*1up9go1*_gcl_au*MTA4MTM0NTMzMi4xNzE2OTkxNjgz&_ga=2.21691827.905501602.1716991681-789075285.1716991681)

### 2. 结合哔哩哔哩的入门Jmeter视频，根据视频做作业
*   [视频链接:](https://www.bilibili.com/video/BV1ty4y1q72g?p=8&spm_id_from=333.880.my_history.page.click) 

### 3. 作业存储位置
*    作业存在本项目的这个路径下：jmx/Jmeter_Tutorial

## 二、根据视频的笔记

### 1. 线程并发和顺序执行
*   默认是并发执行，不是按顺序执行
![screencapture](/screencaptures/jmeter/petstore/2.default-concurrent-execution.png "默认是并发执行")

*   如果需要顺序执行，勾选下面截图的这个选项
  ![screencapture](/screencaptures/jmeter/petstore/3.sequence-execution.png "顺序执行执行")

### 2. setUp和tearDown线程组
*   入口: Test Plan右键 -> Add -> Threads -> setUp/tearDown Thread Group
![screencapture](/screencaptures/jmeter/petstore/4.setup-teardown-thread.png "setUp 和 tearDown线程组")

### 3. Thread group的properties, 线程组设置细节
*    Number of Threads (users): 模拟用户的数量
*    Ramp-up period(seconds): 程序准备时间
*    Loop Count: 每个user执行的循环次数，如果勾选infinite(永远)，就不停执行下去
*    Same user on each iteration：If selected, cookie and cache data from the first sampler response are used in subsequent requests (requires a global Cookie and Cache Manager respectively)
*    Specify Thread lifetime：和Loop count勾选infinite时组合使用，一定时间内停止执行<br>
     Duration (seconds):持续时间<br>
     Startup delay (seconds):启动延迟<br>

### 4. Http请求默认值
*   入口: Test Plan右键 -> Add -> Config Elements -> HTTP Request Defaults
*   接口公用的属性可以设置默认值，这样不用每个接口都要写
*   ![screencapture](/screencaptures/jmeter/petstore/5.http-request-default.png "http线程默认值")
