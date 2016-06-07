def test():
	return True

def movetoposition(x, y):
	pass

def introspec():
	return filter(lambda x: x[0] != "_", globals())

if __name__ == "__main__":
	print(introspec())
