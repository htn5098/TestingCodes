.all: | proc_rawdata RET_cal

proc_rawdata: 
	@module purge
	@module load python
	@python batchsub_process_raw.py
	@echo "Processing is in progress"

RET_cal:  
	@qsub 

clean_output:
	rm *.o*

clean_batch:
	rm batch*.pbs
