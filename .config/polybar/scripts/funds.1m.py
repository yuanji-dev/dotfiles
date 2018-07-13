#!/usr/bin/env LC_ALL=en_US.UTF-8 /usr/local/bin/python3
# coding: utf-8

import re
import json
import urllib.request


RE_FUND_INFO = re.compile('jsonpgz\((.*)\)')

def get_info(fid):
    with urllib.request.urlopen('http://fundgz.1234567.com.cn/js/%s.js' % fid) as f:
        content = f.read().decode('utf-8')
        match = RE_FUND_INFO.match(content)
        if match:
            data_str = match.group(1)
            data = json.loads(data_str)
            name = data['name']
            gszzl = data['gszzl']
            if gszzl > '0':
                icon = 'image=iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QAyQACAALwzISXAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4AQHACkSBTjB+AAAALNJREFUOMvVk70NAjEMhb87WYiGBZAQU7ABNSVSWpZgEEagsJDoKBELUCEKFuBuCKTw0xyQC0lICe5i+/k9/wT+3opUUJQhcAUqa8I5ZQT4tANwioGTCkQZA9vmOQE2oUJFhL0DXBz33RpKUfCLfLTQJMx9IlEWuQr6QB3prGtNS1lwiMvEYo7ekNsKRBkB+y+rH1hDFVOwy7ids+gbVzrsM6CXeYDTF85xroB1ZoHb73ymB5RhJkpZTihGAAAAAElFTkSuQmCC color=#000000'
            else:
                icon = 'image=iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QABACnAADQ9FZaAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4AQHACQ1FZwK3gAAAMRJREFUOMvNkjEKAjEQRZ+jKNjYKh5AbzCdjVcQj+BFPIKlp7EMeAJrUbASQVCEr80uG9cNbqe/Cgn/5WUI/DqNfBHM+kCzbs+lPUAr2pwBq5qABbB+M8gszkDvS/kOdAG5VBgEM4ApsP0CGLukjxlEoA0wSZR3Lo0qhxhZDIBDAmDA0wsBLD51CZeOwLKivHbprZx6AkAHuEXbD5fawYwywMqAzOKeDTTPvKqcTGZBMLsGs0utn5gADYEHcKp9e9ni//MCDtNCE3qjsIwAAAAASUVORK5CYII= color=#000000'
            url = 'href=http://fund.eastmoney.com/%s.html' % fid
            return dict(name=name, gszzl=gszzl, icon=icon, url=url)

if __name__ == "__main__":
    infos = []
    d_000311 = get_info('000311')
    d_000478 = get_info('110003')
    d_110022 = get_info('110022')
    for d in [d_000311, d_000478, d_110022]:
        infos.append('{name}:{gszzl}'.format(name=d['name'][0], gszzl=d['gszzl']))
    print('｜'.join(infos))
