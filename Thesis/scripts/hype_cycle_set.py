file = open('C:\\Users\\sko\\Documents\\FOM\\Thesis\\hype_cycles_list.txt', 'r')
strFile = file.read()

lines = strFile.split('\n')

innovation_trigger_2017 = set(lines[2].split(', '))
innovation_trigger_2016 = set(lines[8].split(', '))
innovation_trigger_2015 = set(lines[14].split(', '))
innovation_trigger_2014 = set(lines[20].split(', '))
innovation_trigger_2013 = set(lines[26].split(', '))

peak_of_inflated_expectations_2017 = set(lines[4].split(', '))
peak_of_inflated_expectations_2016 = set(lines[10].split(', '))
peak_of_inflated_expectations_2015 = set(lines[16].split(', '))
peak_of_inflated_expectations_2014 = set(lines[22].split(', '))
peak_of_inflated_expectations_2013 = set(lines[28].split(', '))

innovation_triggers = [innovation_trigger_2016, innovation_trigger_2015, innovation_trigger_2014, innovation_trigger_2013]

peak_of_inflated_expectations = [peak_of_inflated_expectations_2016, peak_of_inflated_expectations_2015, peak_of_inflated_expectations_2014, peak_of_inflated_expectations_2013]

print("Peak of Inflated Expectations 2017:")
print(peak_of_inflated_expectations_2017)

print("Peak of Inflated Expectations 2016:")
print(peak_of_inflated_expectations_2016)

print("Peak of Inflated Expectations 2015:")
print(peak_of_inflated_expectations_2015)

print("Peak of Inflated Expectations 2014:")
print(peak_of_inflated_expectations_2014)

print("Peak of Inflated Expectations 2013:")
print(peak_of_inflated_expectations_2013)

print("\nIntersection Peak of Inflated Expectations 2017 with past years:")
for poie in peak_of_inflated_expectations:
	print(peak_of_inflated_expectations_2017.intersection(poie))

print("\nIntersection Peak of Inflated Expectations 2017 with Innovation Triggers of past years:")
for it in innovation_triggers:
	print(peak_of_inflated_expectations_2017.intersection(it))