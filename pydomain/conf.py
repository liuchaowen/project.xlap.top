# -*- coding: utf-8 -*-
from pymemcache.client.base import Client

num = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
letter = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
suffixes = ['kim', 'space', 'press', 'love', 'pro', 'online', 'store', 'fun', 'cc', 'fit', 'group', 'luxe', 'beer',
            'yoga', 'run', 'show', 'city', 'gold', 'host', 'law', 'fans', 'zone', 'mobi',
            'work', 'pub', 'chat', 'cool', 'plus', 'today', 'wiki', 'live', 'asia', 'co', 'link', 'design', 'info',
            'biz', 'pro', 'ren', 'video', 'website', 'xin', 'wang', 'art', 'site', 'tech', 'ltd', 'top', 'fund', 'guru', 'social'
            'team', 'email', 'center', 'icu', 'company']


def init():
    global _global_dict
    mc = Client(('127.0.0.1', '11211'))
    _global_dict = {}
    set_value("mc", mc)
    set_value("num", num)
    set_value("letter", letter)
    set_value("suffixes", suffixes)


def set_value(name, value):
    _global_dict[name] = value


def get_value(name, defValue=None):
    try:
        return _global_dict[name]
    except KeyError:
        return defValue
