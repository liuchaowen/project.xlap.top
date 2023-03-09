#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# 轮询以域名结尾的英文单词
import re
import time
import conf
import requests
from bs4 import BeautifulSoup

isPrintFailLog = False

conf.init()
suffixes = conf.get_value('suffixes')

def getword(key):
    url = "https://www.digopaul.com/cn/english-words-that-contain-"+key+".html"
    html = requests.get(url)
    bsj = BeautifulSoup(html.text,features="html.parser")
    domains = []
    for tag in bsj.find_all(href=re.compile("/cn/english-word/(\w+).html")):
        _word = tag.string
        if _word == key:
            continue
        elif _word.endswith(key):  # 以域名结尾的单词 例 .red   bared 查 ba.red
            head = _word.strip(key)
            if len(head) <= 3: # 三个字母或以下的贼贵，不考虑
                continue
            else:
                domains.append(head)
    return domains

# 查询是否注册
def check(domain):
    url = "http://panda.www.net.cn/cgi-bin/check.cgi?area_domain="+domain
    html = requests.get(url)
    bsj = BeautifulSoup(html.text,features="html.parser")
    onum = bsj.find("original")
    if onum != None:
        num = onum.get_text()[:3]
        if num == '210':
            print(domain)
        elif num == "213":
            if isPrintFailLog:
                print("查询超时，请重新查询")
        elif num == "211":
            if isPrintFailLog:
                print("[x] %s" % domain)
        elif num == "212":
            if isPrintFailLog:
                print(f"{domain} 无效域名")
        else:
            print(html.text)
            print("出现未知问题")
        return num
    else:
        print("让我哭一会，ip可能被封了")
        return None


def search(name, suffix):
    domain = name + '.' + suffix
    num = check(domain)
    if num != None:
        if num == '210':
            return domain
    return False


if __name__ == '__main__':
    for suffix in suffixes:
        domains = getword(suffix)
        print("域名：." + suffix + ",共" + str(len(domains)) + "个符合要求")
        for domain in domains:
            search(domain, suffix)
            time.sleep(0.1)