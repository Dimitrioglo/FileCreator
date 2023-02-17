
clear_folder:
	rm -rf Files/*

create_files: clear_folder
	bash create_files.sh --fileinput input_file.pdf --filetype pdf --count 3

upload_to_s3:
	aws s3 --profile rw cp Files s3://dev-zenith-drago-document-migration/ --recursive --region=eu-west-2
