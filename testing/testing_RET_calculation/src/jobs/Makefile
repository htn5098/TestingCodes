.DEFAULT_GOAL := processing_data

processing_data: install_packages
	@qsub testing_process_raw_data.pbs
	@echo "Processing is in progress"

install_packages:
	@qsub testing_install.pbs
	@echo "Install is in progress"
 
clean:
	rm *.o*
