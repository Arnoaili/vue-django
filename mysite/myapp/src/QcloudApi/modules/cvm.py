#!/usr/bin/python
# -*- coding: utf-8 -*-

from base import Base

class Cvm(Base):
    requestHost = 'cvm.api.qcloud.com'

def main():
    action = 'DescribeInstances'
    config = {
        'Region': 'sh',
        'secretId': 'AKIDnX6UjeBdjiXDh4TM9oIbigT6YoyzwtdM',
        'secretKey': 'mNm03vdBXihVDj4DC0c4LXYP4XvBHCyc',
        'method': 'get'
    }
    params = {}
    service = Cvm(config)
    print service.call(action, params)

if (__name__ == '__main__'):
    main()
