#!/usr/bin/env python3

import os, sys, re, urllib.request

# Config part
matchLine = re.compile(r'^(?:127.0.0.1|::1)[ \t]+(\S+)')
hostsFiles = [
	'http://winhelp2002.mvps.org/hosts.txt',
	'http://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&startdate[day]=&startdate[month]=&startdate[year]=&mimetype=plaintext'
]
actionFile = '/etc/privoxy/hosts-blacklist.action'

# Code part
hosts = []
for hostsFile in hostsFiles:
	hostsFile = urllib.request.urlopen(hostsFile)
	for l in hostsFile:
		res = matchLine.search(l.decode('utf8'))
		if res:
			host = res.group(1)
			subHost = host
			isNewHost = host not in hosts
			while isNewHost and '.' in subHost:
				subHost = subHost[subHost.find('.') + 1:]
				isNewHost = host not in hosts
			if isNewHost:
				hosts.append(host)
localFile = os.path.join(os.path.dirname(sys.argv[0]), 'hosts-blacklist.txt')
if os.path.isfile(localFile):
	f = open(localFile, 'rb')
	for h in f:
		h = h.strip().decode('utf8')
		if h and h not in hosts:
			hosts.append(h)
	f.close()
hosts.sort()
action = open(actionFile, 'w')
action.write('{ +block{Matched hosts blacklist} }\n')
for h in hosts:
	action.write('.' + h + '\n')
action.close()
