import operator, sys

def calc(word):
	t_dict = {}
	total = 0.0
	c = 0.0
	with open("All_comments.tsv", 'r') as f:
		temp = {}
		for line in f:
			total += 1

			data = line.rstrip().split('\t')
			target = data[2]

			if target in t_dict:
				t_dict[target] += 1
			else:
				t_dict[target] = 1.0
			
			if word.lower() in data[4]:
				if target in temp:
					temp[target] += 1
				else:
					temp[target] = 1.0

				c += 1
	
		for key in t_dict:
			t_dict[key] /= total
		for key in temp:
			temp[key] /= c

	print c
	for (a,b) in reversed(sorted(t_dict.iteritems(), key=operator.itemgetter(1))):
		if b > 0.001: print a,b
	print "\n"
	for (a,b) in reversed(sorted(temp.iteritems(), key=operator.itemgetter(1))):
		if b > 0.001: print a,b

calc(sys.argv[1])
