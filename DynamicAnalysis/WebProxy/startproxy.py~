from pyWebProxy.pywebproxy import *
import time
import sys
from getopt import getopt

args=sys.argv[1:]
(opts,vals)=getopt(args,'i:p:',['proxyip','proxyport'])
proxy_ip=opts[0][1]
proxy_port=opts[1][1]
Proxy(proxy_ip,proxy_port,'./WebProxy/proxydata/','on')
status=raw_input()
if status=='stop':
	Proxy(proxy_ip,proxy_port,'./WebProxy/proxydata/','off')
