#!/usr/bin/env python3

import urllib.request, re

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
hosts.sort()
action = open(actionFile, 'w')
action.write('{ +block{Matched hosts blacklist} }\n')
for h in hosts:
	action.write('.' + h + '\n')
action.close()
