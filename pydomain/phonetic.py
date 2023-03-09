#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# 轮询中文单拼（不用看了）、双拼（也不用看了，有结果的都没了）、三拼（要看分值）
from Pinyin2Hanzi import dag
from Pinyin2Hanzi import DefaultDagParams

import conf
import requests
from bs4 import BeautifulSoup

isPrintFailLog = False

conf.init()
mc = conf.get_value('mc')
suffixes = conf.get_value('suffixes')
goodSuffixes = conf.get_value('goodSuffixes')

a = ["a", "ai", "an", "ang", "ao", "ba"]
b = ["bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao", "bie", "bin", "bing", "bo", "bu"]
c = ["ca", "cai", "can", "cang", "cao", "ce", "cen", "ceng", "ci", "cong", "cou", "cu", "cuan", "cui", "cun", "cuo"]
ch = ["cha", "chai", "chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chua", "chuai", "chuan", "chuang", "chui",
      "chun", "chuo"]
d = ["da", "dai", "dan", "dang", "dao", "de", "den", "dei", "deng", "di", "dia", "dian", "diao", "die", "ding", "diu", "dong", "dou", "du", "duan",
     "dui", "dun", "duo"]
e = ["e", "ei", "en", "eng", "er"]
f = ["fa", "fan", "fang", "fei", "fen", "feng", "fo", "fou", "fu"]
g = ["ga", "gai", "gan", "gang", "gao", "ge", "gei", "gen", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo"]
h = ["ha", "hai", "han", "hang", "hao", "he", "hei", "hen", "heng", "hong", "hou", "hu", "hua", "huai", "huan", "huang", "hui", "hun", "huo"]
j = ["ji", "jia", "jian", "jiao", "jie", "jin", "jing", "jiong", "jiu", "ju", "jian", "jue", "jun"]
k = ["ka", "kai", "kan", "kang", "kao", "ke", "ken", "keng", "kong", "kou", "ku", "kua", "kuai", "kuan", "kuang", "kui", "kun", "kuo"]
l = ["la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lia", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu",
     "lv", "luan", "lue", "lve", "lun", "luo"]
m = ["ma", "mai", "man", "mang", "mao", "me", "mei", "men", "meng", "mi", "mian", "miao", "mie", "min", "ming", "miu", "mo", "mou", "mu"]
n = ["na", "nai", "nan", "nang", "nao", "ne", "nei", "nen", "neng", "ni", "nian", "niang", "niao", "nie", "nin", "ning", "niu", "nong", "nou", "nu",
     "nv", "nuan", "nve", "nuo", "nun"]
o = ["o", "ou"]
p = ["pa", "pai", "pan", "pang", "pao", "pei", "pen", "peng", "pi", "pian", "piao", "pie", "pin", "ping", "po", "pou", "pu"]
q = ["qi", "qia", "qian", "qiang", "qiao", "qie", "qin", "qing", "qiong", "qiu", "qu", "quan", "que", "qun"]
r = ["ran", "rang", "rao", "re", "ren", "reng", "ri", "rong", "rou", "ru", "ruan", "rui", "run", "ruo"]
s = ["sa", "sai", "san", "sang", "sao", "se", "sen", "seng", "si", "song", "sou", "su", "suan", "sui", "sun", "suo"]
sh = ["sha", "shai", "shan", "shang", "shao", "shei", "shen", "sheng", "shi", "shou", "shu", "shua", "shuai", "shuan", "shu", "shui", "shun", "shuo"]
t = ["ta", "tai", "tan", "tang", "tao", "te", "teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tuan", "tui", "tun", "tuo"]
w = ["wa", "wai", "wan", "wang", "wei", "weng", "wo", "wu"]
x = ["xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu", "xu", "xuan", "xue", "xun"]
y = ["ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yo", "yong", "you", "yu", "yuan", "yue", "yun"]
z = ["za", "zai", "zan", "zang", "zao", "ze", "zei", "zen", "zeng", "zi", "zong", "zou", "zu", "zuan", "zui", "zun", "zuo"]
zh = ["zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhei", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuai", "zhuan", "zhuang",
      "zhui", "zhun", "zhuo"]
pins = a + b + c + ch + d + e + f + g + h + j + k + l + m + n + o + p + q + r + s + sh + t + w + x + y + z + zh
print("一共有" + str(len(pins)) + "个拼音单元")

okList = []


def getDoublePin():
    domainList = []
    for pin1 in pins:
        for pin2 in pins:
            domainList.append((pin1, pin2))
    return domainList


def getThreePin():
    domainList = []
    for pin1 in pins:
        for pin2 in pins:
            for pin3 in pins:
                domainList.append((pin1, pin2, pin3))
    return domainList


# 查询是否注册
def check(domain, info):
    url = "http://panda.www.net.cn/cgi-bin/check.cgi?area_domain=" + domain
    html = requests.get(url)
    bsj = BeautifulSoup(html.text, features="html.parser")
    onum = bsj.find("original")
    if onum != None:
        num = onum.get_text()[:3]
        if num == '210':
            mc.set(domain, info.encode('utf-8'))
            print("[YES]", domain, info)
        elif num == "213":
            print("查询超时，请重新查询")
        elif num == "211":
            if isPrintFailLog:
                print("[x]", domain, info)
            mc.set(domain, "false")
        elif num == "212":
            print(f"{domain} 无效域名")
        elif num == "214":
            # print("[x]", end="")
            print("", end="")
        else:
            print(html.text)
            print("出现未知问题")
        return num
    else:
        print("让我哭一会，ip可能被封了")
        return None


# [x] 本次查是被注 [*YES/NO] *代表之前查过 [YES] 本次查是可以注的
if __name__ == '__main__':
    domains = getThreePin()
    dagParams = DefaultDagParams()
    for pins in domains:
        if len(pins) == 2:
            domain = pins[0] + pins[1]
        elif len(pins) == 3:
            domain = pins[0] + pins[1] + pins[2]
        endDomain = domain + '.com'
        if len(domain) < 6:  # 6个字符的太贵，去掉
            if isPrintFailLog:
                print("[$]" + endDomain)
            continue
        else:
            record = mc.get(endDomain)
            if record == b'false':  # 存在缓存，之前查询过了过,被人注册了
                if isPrintFailLog:
                    print("[*NO]" + endDomain)
                continue
            elif record is None or record == b'true':
                result = dag(dagParams, pins)
                maybeRes = ''
                score = 0
                for res in result:
                    pathData = res.path
                    if len(pathData) == 1:  # 只取有整的值
                        score = res.score * 100
                        maybeRes = maybeRes + " " + pathData[0] + str('%.3f' % score)
                if len(pins) == 3 and score < 20.20:  # 三拼太多，分值低的去掉
                    continue
                if maybeRes == '':
                    continue  # 没有组合成功
                else:
                    check(endDomain, maybeRes)
            else:  # 存在缓存，之前查询过了过,没被人注册
                print("[*YES]" + endDomain + " " + str(record.decode('utf-8')))
