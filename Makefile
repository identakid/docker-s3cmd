build:
	@docker build -t identakid/s3cmd .

run:
	@docker run --rm \
		--name s3cmd \
		-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
		-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
		-v /mnt/s3cmd:/opt \
		identakid/s3cmd \
		$(CMD)
