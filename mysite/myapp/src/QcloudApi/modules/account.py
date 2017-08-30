#!/usr/bin/python
# -*- coding: utf-8 -*-

from base import Base

class Account(Base):
    requestHost = 'account.api.qcloud.com'

def main():
    action = 'DescribeProject'
    config = {
        'Region': 'gz',
        'secretId': 'AKIDnX6UjeBdjiXDh4TM9oIbigT6YoyzwtdM',
        'secretKey': 'mNm03vdBXihVDj4DC0c4LXYP4XvBHCyc',
        'method': 'get'
    }
    params = {}
    service = Account(config)
    print service.call(action, params)

if (__name__ == '__main__'):
    main()
