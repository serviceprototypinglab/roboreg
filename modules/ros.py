def test():
	return True

def movetoposition(x, y):
	return (x, y)

def introspec():
	return filter(lambda x: x[0] != "_" and x[0].islower(), globals())

class SafeGuard:
	def __init__(self):
		from functools import partial

		self.funcs = {}
		for func in introspec():
			self.funcs[func] = globals()[func]
			globals()[func] = partial(self.guard, func)

	def guard(self, func, *args):
		print("**safeguard entry [{:s}]**".format(func))
		x = self.funcs[func](*args)
		print("**safeguard exit [{:s}]**".format(func))
		return x

def safeguard():
	global _sg
	_sg = SafeGuard()

if __name__ == "__main__":
	safeguard()
	print(test())
	print(introspec())
	print(movetoposition(1, 2))
