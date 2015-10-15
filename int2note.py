import random
rr = lambda: random.randint(0,11)
r = lambda: rr(),rr()

note_names = ['c','c#','d','d#','e','f','f#','g','g#','a','a#','b']
def int2note(x): return note_names[x]
