all: | generate print 

date: 
	date > date.txt

ls:
	ls -la > ls.txt

generate: ls date

print: *.txt
	cat $^

