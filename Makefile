build:
	@docker-compose build base

shell:
	@docker-compose run --rm --entrypoint "/bin/bash" base
