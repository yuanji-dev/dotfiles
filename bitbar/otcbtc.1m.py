#!/usr/bin/env LC_ALL=en_US.UTF-8 /usr/local/bin/python3
# coding: utf-8

import hashlib
import hmac
import requests

API_KEY = 'jxfF9I3x84pqfSAbNcJfLDu2KjeeMq1LajTR74Gm'
SECRET = 'Jpm8HpbqxhCOwdBKhtZH0LADyQQv7rhYdfLEbAo4'
END_POINT = 'https://bb.otcbtc.com'

BTC_MKT = 'https://otcbtc.com/sell_offers?currency=btc&fiat_currency=cny&payment_type=all'
EOS_MKT = 'https://otcbtc.com/sell_offers?currency=eos&fiat_currency=cny&payment_type=all'


USERS_API = '%s/api/v2/users/me' % END_POINT
TICKERS_API = '%s/api/v2/tickers' % END_POINT

USERS_API_PAYLOAD = 'GET|/api/v2/users/me|access_key=%s' % API_KEY
SIGNATURE = hmac.new(bytes(SECRET, 'ascii'), bytes(USERS_API_PAYLOAD, 'ascii'), hashlib.sha256).hexdigest()

TICKERS = requests.get(TICKERS_API).json()

MINE = requests.get(USERS_API, params=dict(access_key=API_KEY, signature=SIGNATURE)).json()

def get_last_price(ticker_id):
    data = TICKERS.get(ticker_id)
    if data:
        return float(data['ticker']['last'])

def get_balance(currency):
    accounts = MINE['accounts']
    for data in accounts:
        if data['currency'] == currency:
            return float(data['balance'])

def main():
    btc_price = get_last_price('btc_usdt')
    btc_balance = get_balance('btc')
    eos_price = get_last_price('eos_usdt')
    eos_balance = get_balance('eos')
    all_balance = btc_price * btc_balance + eos_price * eos_balance
    print('仮:{:.2f}'.format(all_balance))
    print('---')
    print('BTC:{:.2f} * {:.4f} = ${:.2f} | href={}'.format(btc_price, btc_balance, btc_price*btc_balance, BTC_MKT))
    print('EOS:{:.2f} * {:.4f} = ${:.2f} | href={}'.format(eos_price, eos_balance, eos_price*eos_balance, EOS_MKT))

if __name__ == "__main__":
    main()
