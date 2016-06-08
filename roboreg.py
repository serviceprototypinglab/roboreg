#!/usr/bin/env python3
#
# Robot registry client

import urllib.request
import urllib.parse
import json

username = "ecrp"
password = "s3cr3t"
eauth = "auto"
saltapi = "http://localhost:8001"

def login():
	data = 'username={:s}&password={:s}&eauth={:s}'.format(username, password, eauth)
	f = urllib.request.urlopen("{:s}/login".format(saltapi), bytearray(data, "utf-8"))
	s = json.loads(f.read().decode("utf-8"))
	token = s["return"][0]["token"]
	return token

def query(data, token):
	headers = {}
	headers["X-Auth-Token"] = token
	#headers["Content-Type"] = "application/json"
	req = urllib.request.Request(saltapi, bytearray(data, "utf-8"), headers)
	f = urllib.request.urlopen(req)
	s = json.loads(f.read().decode("utf-8"))
	return s

def introspec(token):
	data = []
	data.append(("client", "local"))
	data.append(("tgt", "*"))
	data.append(("fun", "ros.introspec"))
	data = urllib.parse.urlencode(data)
	#d = {}
	#for k, v in data:
	#	d[k] = v
	#data = json.dumps(d)
	s = query(data, token)
	print(s["return"][0])

token = login()

introspec(token)
