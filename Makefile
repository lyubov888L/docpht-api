build = @echo "\e[1;35mBuilding docker image $<\e[0m"
enabled = @echo "\e[1;31madding .enabled file to keep track of installing process $<\e[0m"
no_cache = @echo "\e[1;34musing --no-cache build $<\e[0m"
# .ONESHELL:
.PHONY: build_api
build_api: docker compose clean

.PHONY: docker
docker:
	$(build)
	bash git_projects.sh -install-docpht
	bash git_projects.sh -install-hapttic



.PHONY: compose
compose: 
	$(no_cache)
	$(shell sudo docker-compose build --no-cache )
	$(shell sudo docker-compose up -d )



.PHONY: clean
clean:
	$(enabled)
	@touch .enabled

