import operator

dict = {}
t_dict = {}
all_words = {}

def compare(d2):
	d1 = t_dict
	if (d2["count"] < 300): return False
	for key in d1:
		if key == "count": continue
		if key in d2:
			max = d1[key] if d1[key] > d2[key] else d2[key]
			min = d1[key] if d1[key] < d2[key] else d2[key]
			change = (max - min) / max
			if (change >= 0.25 and max > 0.5) or (change >= 0.5 and max > 0.3) or (change >= 1 and max > 0.1) or change >= 3:
				print key, d1[key], d2[key], d2["count"],
				return True
		elif d1[key] > 0.15:
			print key, d1[key],
			return True

	for key in d2:
		if key == "count": continue
		if key in d1:
			max = d1[key] if d1[key] > d2[key] else d2[key]
			min = d1[key] if d1[key] < d2[key] else d2[key]
			change = (max - min) / max
			if (change >= 0.25 and max > 0.5) or (change >= 0.5 and max > 0.3) or (change >= 1 and max > 0.1) or change >= 3:
				print key, d1[key], d2[key], d2["count"],
				return True
		elif d2[key] > 0.15:
			print key, d2[key],
			return True

	return False

def calc(word):
	c = 0.0
	temp = {}
	for id in dict:
		data = dict[id]
		target = data[2]

		if word.lower() in data[4]:
			if target in temp:
				temp[target] += 1
			else:
				temp[target] = 1.0
			c += 1
	
	for key in temp:
		temp[key] /= c
	
	temp["count"] = c
	
	return compare(temp)

with open("All_comments.tsv", 'r') as f:
	total = 0.0

	for line in f:
		data = line.rstrip().split('\t')
		dict[data[1]] = data
		total += 1
		target = data[2]
		if target in t_dict:
			t_dict[target] += 1
		else:
			t_dict[target] = 1.0

		for word in data[4].split(' '):
			all_words[word] = 0

	for t in t_dict:
		t_dict[t] /= total

for word in all_words:
	if calc(word):
		print word.lower()
