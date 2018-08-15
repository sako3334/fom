import glob
import os

data_dir = r'D:\dev\fom\Thesis\data'

os.chdir(data_dir)

data_file_pattern_wos = glob.glob(data_dir + r'./wos*ART.txt')
data_file_pattern_wos.extend(glob.glob(data_dir + r'./wos*PROC.txt'))

for wos_file in data_file_pattern_wos:
    dict_year_record = {}

    with open(wos_file, 'r', errors='ignore') as data_file_raw:
        line_input = iter(data_file_raw)
        for li in line_input:
            if li[0].isdigit():
                li_split = li.split('\t')
                dict_year_record[li_split[0]] = li_split[1]

    lst_year_record = sorted(dict_year_record.keys())

    for i,j in enumerate(range(1, len(lst_year_record))):
    #   print("a", lst_year_record[j], lst_year_record[i])
        if int(lst_year_record[j]) - int(lst_year_record[i]) > 1:
            for k in range(int(lst_year_record[j]) - int(lst_year_record[i]) - 1):
    #           print("b", int(lst_year_record[j]) - k - 1)
                dict_year_record[str(int(lst_year_record[j]) - k - 1)] = "0"

    # for k in sorted(dict_year_record.keys()):
        # print(k + ": " + dict_year_record[k])

    with open(wos_file.lower().replace(".txt", "_ts.csv"), 'w+') as data_file_ts:
        data_file_ts.write("years,records\n")
        for k in sorted(dict_year_record.keys()):
            data_file_ts.write("%s,%s\n" % (k, dict_year_record[k]))

    data_file_raw.close()
    data_file_ts.close()