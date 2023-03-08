# -*- coding: UTF-8 -*-
import json
import pymongo
# 连接数据库
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["runoobdb"]
mycol = mydb["sites"]
# 读取数据
data = mycol.find()
res = []
i = 0
for item in data:
    i += 1
    tmp = {}
    tmp['id'] = i
    tmp['name'] = item['name']
    tmp['title'] = item['title']
    tmp['link'] = item['link']
    tmp['avatar'] = item['avatar']
    tmp['date'] = item['date']
    res.append(tmp)

with open("./result/data_res.json", "w", encoding="utf-8") as dump_f:
    json.dump(res, dump_f, ensure_ascii=False)
