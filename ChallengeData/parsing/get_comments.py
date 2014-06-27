with open("All.tsv", 'r') as fr:
	with open("All_comments.tsv", 'w') as fw:
		fr.readline()
		for line in fr:
			data = line.rstrip().split('\t')
			if len(data) < 15:
				fw.write("%s\t%s\t%s\tNone\tNone\n" % (data[0], data[1], data[3]))
			else:
				fw.write("%s\t%s\t%s\t%s\t%s\n" % (data[0], data[1], data[3], data[13], data[14]))
