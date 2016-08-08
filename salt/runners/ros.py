import time
import salt.client

def tail(outputter=None, display_progress=False):
	client = salt.client.LocalClient(__opts__['conf_file'])

	seen = {}

	while True:
		time.sleep(0.1)
		#print("Hello world")

		#minions = client.cmd('*', 'test.ping', timeout=1)
		minions = client.cmd('*', 'ros.tail', ["*ignored*"], timeout=1)
		#print(minions)

		for name in minions:
			if len(minions) > 1:
				print(name)
			if not name in seen:
				seen[name] = []
			for line in minions[name]:
				if not line in seen[name]:
					seen[name].append(line)
					print(" {:s}".format(line.strip()))

	#if display_progress:
	#	__jid_event__.fire_event({'message': 'A progress message'}, 'progress')

