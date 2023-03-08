# -*- coding:UTF-8 -*-
import json
import os
from urllib.parse import urlparse
import requests
from bs4 import BeautifulSoup
import pymongo

# 由于文件中有多行，直接读取会出现错误，因此一行一行读取
file = open("./result/data.json", 'r')
papers = []
headers = {
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'
}

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["runoobdb"]
mycol = mydb["sites"]

for line in file.readlines():
    dic = json.loads(line)
    papers.append(dic)

res = []
for yearitem in papers:
    count = len(yearitem)
    print(count)
    new_item = {}
    for item in yearitem:
        new_item = item
        try:
            # 跳转链接
            response = requests.get(item['link'], headers=headers)
            html = response.content.decode('utf-8')
            soup = BeautifulSoup(html, 'lxml')
            div_soup = soup.select('div.cleft')
            a_soup = div_soup[0].find_all('a')
            a = a_soup[0]
            href = a.get('href')
            new_item['link'] = href
            # ga头像
            avatar = item['avatar']
            ga_avatar_url = 'https://gravatar.foreverblog.cn'
            real_avatar_url = 'https://s.gravatar.com'
            qq_avatar_url = 'https://q2.qlogo.cn'
            path = avatar
            file_format = '.webp'
            avatar_key = os.urandom(16).hex()  # 这样生成是32个字符的
            if ga_avatar_url in avatar:
                uri_obj = urlparse(avatar)
                uri = uri_obj.path
                uri_arr = uri.split('/')
                avatar_key = uri_arr[2]
                path = real_avatar_url + uri
                file_format = '.png'
            elif qq_avatar_url in avatar:
                file_format = '.jpeg'
            else:
                print('err! unknown avatar url!')
            r = requests.get(path)  # 获取到本地
            with open('../assets/avatar/'+avatar_key+file_format, 'wb') as f:
                f.write(r.content)
            new_item['avatar'] = avatar_key+file_format
            # 数据判存
            count = mycol.count_documents(
                {"link": href})
            if count == 0:
                i = mycol.insert_one(new_item)
                print(new_item)
            else:
                print(new_item["name"]+","+str(count)+",数据已存在!")
        except Exception as e:
            print(e)
            continue
