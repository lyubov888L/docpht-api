build = @echo "\e[1;35mBuilding docker image $<\e[0m"
enabled = @echo "\e[1;31madding .enabled file to keep track of installing process $<\e[0m"
no_cache = @echo "\e[1;34musing --no-cache build $<\e[0m"
move_file = @echo "\e[1;32mrunning go mod init and copying files $< to $@\e[0m"
.ONESHELL:
.PHONY: build_api
build_api: docker preflight compose clean




.PHONY: docker
docker:
	$(build)
	bash git-projects.sh -install-docpht
# bash git-projects.sh -install-hapttic



preflight:
	$(move_file)
	cp Dockerfile.docpht docpht/Dockerfile.docpht
# cp Dockerfile.haptic hapttic/Dockerfile.haptic
# cd hapttic/ && go mod init hapttic-alpha
# cd ..




.PHONY: compose
compose: 
	$(no_cache)
	sudo docker-compose build --no-cache --force-rm
	sudo docker-compose up -d --force-recreate
# $(shell sudo docker-compose build --no-cache )
# $(shell sudo docker-compose up -d )



.PHONY: clean
clean:
	$(enabled)
	@touch .enabled

