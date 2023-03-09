# -*- coding: utf-8 -*-
# 轮询三字符
from pymemcache.client.base import Client
import requests
from bs4 import BeautifulSoup

import conf

conf.init()
num = conf.get_value('num')
letter = conf.get_value('letter')
suffixes = conf.get_value('suffixes')

mc = Client(('127.0.0.1', '11211'))
isPrintFailLog = True


def getTwoStr(isNoNum=False):
    domainList = []
    if isNoNum:
        allStr = letter
    else:
        allStr = num + letter
    for x in allStr:
        for y in allStr:
            pin = x + y
            domainList.append(pin)
    return domainList


def getThreeStr(isNoNum=False):
    domainList = []
    if isNoNum:
        allStr = letter
    else:
        allStr = num + letter
    for x in allStr:
        for y in allStr:
            for z in allStr:
                pin = x + y + z
                domainList.append(pin)
    return domainList


# 查询是否注册
def check(domain):
    url = "http://panda.www.net.cn/cgi-bin/check.cgi?area_domain=" + domain
    html = requests.get(url)
    bsj = BeautifulSoup(html.text, features="html.parser")
    onum = bsj.find("original")
    if onum != None:
        num = onum.get_text()[:3]
        if num == '210':
            mc.set(domain, "true")
            print("[OK]", domain)
        elif num == "213":
            if isPrintFailLog:
                print("查询超时，请重新查询")
        elif num == "211":
            if isPrintFailLog:
                # print("[x]" + domain)
                mc.set(domain, "false")
                print(".", end="")
        elif num == "212":
            print(f"{domain} 无效域名")
        elif num == "214":
            print("", end="")
        else:
            print(html.text)
            print("出现未知问题")
        return num
    else:
        print("让我哭一会，ip可能被封了")
        return None


# 通过更换 getDoublePin getSinglePin 切换单双拼；comSuffixes 切换后缀
if __name__ == '__main__':
    domains = getTwoStr(isNoNum=True)
    for suffix in suffixes:
        for domain in domains:
            endDomain = domain + '.' + suffix
            record = mc.get(endDomain)
            if record == "false":  # 存在缓存，之前查询过了过
                print("*", end="")
                continue
            else:
                check(endDomain)
