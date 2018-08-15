import csv
import glob
import os
from collections import Counter

data_dir = r'D:\dev\fom\Thesis\data'

os.chdir(data_dir)

data_file_pattern_acm = glob.glob(data_dir + r'./acm*ART.csv')
data_file_pattern_acm.extend(glob.glob(data_dir + r'./acm*PROC.csv'))

# print data_file_pattern_acm

for acm_file in data_file_pattern_acm:
	dict_year_record = {}
	lst_years = []

	with open(acm_file, 'r') as csv_file_raw:
		data_file_raw = csv.reader(csv_file_raw)
		for i, line in enumerate(data_file_raw):
			if line[18][0].isdigit():
				lst_years.append(line[18])
			# print str(i) + ": " + line[18]
		dict_year_record = dict(Counter(lst_years))
		# print dict_year_record

	lst_year_record = sorted(dict_year_record.keys())

	for i,j in enumerate(range(1, len(lst_year_record))):
		# print("a", lst_year_record[j], lst_year_record[i])
		if int(lst_year_record[j]) - int(lst_year_record[i]) > 1:
			for k in range(int(lst_year_record[j]) - int(lst_year_record[i]) - 1):
				# print("b", str(int(lst_year_record[j]) - k - 1))
				dict_year_record[str(int(lst_year_record[j]) - k - 1)] = "0"

	# for k in sorted(dict_year_record.keys()):
		# print(k, dict_year_record[k])

	with open(acm_file.lower().replace(".csv", "_ts.csv"), 'w+') as csv_output:
		fieldnames = ['years', 'records']
		writer = csv.DictWriter(csv_output, fieldnames=fieldnames, lineterminator='\n')
		
		writer.writeheader()
		for k in sorted(dict_year_record.keys()):
			writer.writerow({"%s" % (fieldnames[0]): "%s" % (k), "%s" % (fieldnames[1]): "%s" % (dict_year_record[k])})
