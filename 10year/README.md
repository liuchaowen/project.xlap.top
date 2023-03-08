# ForeverBlog

数据来源于: [十年之约](https://www.foreverblog.cn/)

#### 目录结构

/根目录

* 展现层

/data 数据层

* /origin 原始数据
* /deal 抓取link后的数据
* /result 输出的数据

#### 数据整理

1. 爬取数据

   1. 爬取方法
      * 方案一：使用八爪鱼工具获取每年的原始数据（弃用）原因：头像加载延时导致拿到的base64用不了
      * 方案二：运行scrapy.py，用bs4库爬取数据;
        * 直接 requests.get(url) 方法。（弃用)  原因：有滚动加载更多数据问题
        * 手动加载
          * 先chrome把数据加载完
          * 使用审查元素，找到id为normal的ul，右键->以HTML格式修改，复制内容放到html文件中
          * python加载执行
   2. 最后,  输出/origin/year.json
2. 运行merge.py，合并数据，输出/result/data.json
3. 运行insert.py，读取文件，处理并插入数据，

   * 对真正的【博客地址】进行抓取（非跳转页面地址）
   * 对真正的【gravatar头像】进行处理
   * 入库MongoDB
4. 运行output.py，抽取db并输出数据，取出db数据, 输出/result/data_res.json

注意：运行py文件请使用3.0版本，python3 xxx.py

#### 文档生成

生成平台使用声明

进入到 /data/md 目录

 ` md-to-html --input STATEMENT.md`

#### 数据展现

直接使用html js css就好了，代码看文件
