class SafeGuard:
	def __init__(self, f=None):
		from functools import partial
		import os

		self.f = f

		self.funcs = {}
		#for func in introspec():
		#	self.funcs[func] = globals()[func]
		#	globals()[func] = partial(self.guard, func)

		# FIXME: is set to /root otherwise which cannot be written to
		os.chdir("/home/ecrp/ecrp-devicemanager")

		self.lockdir = ".locks"
		#os.makedirs(self.lockdir, exists_ok=True) # PY3
		try:
			os.makedirs(self.lockdir)
		except:
			pass

	def guard(self, func, *args):
		import os

		lockfile = os.path.join(self.lockdir, func + ".lock")

		if os.path.isfile(lockfile):
			print("**safeguard block [{:s}]**".format(func))
			return
		open(lockfile, "w")
		print("**safeguard entry [{:s}]**".format(func))
		x = self.funcs[func](*args)
		print("**safeguard exit [{:s}]**".format(func))
		os.remove(lockfile)
		return x

	def __call__(self, *args):
		func = self.f.__name__
		self.funcs[func] = self.f
		return self.guard(func, *args)

def SafeGuardWrapper(f):
	def f_int(*args):
		sg = SafeGuard(f)
		return sg(*args)
	return f_int

@SafeGuardWrapper
def test():
	return True

@SafeGuardWrapper
def movetoposition(x, y):
	return (x, y)

@SafeGuardWrapper
def introspec():
	import os
	funcs = filter(lambda x: x[0] != "_" and x[0].islower(), globals())
	lockedfuncs = {}
	for func in funcs:
		lockdir = ".locks"
		lockfile = os.path.join(lockdir, func + ".lock")
		lockedfuncs[func] = os.path.isfile(lockfile)
	return lockedfuncs

def safeguard():
	global _sg
	_sg = SafeGuard()

if __name__ == "__main__":
	safeguard()
	print(test())
	print(introspec())
	print(movetoposition(1, 2))
else:
	safeguard()
