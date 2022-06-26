build = @echo "\e[1;35mBuilding docker image $<\e[0m"
enabled = @echo "\e[1;31madding .enabled file to keep track of installing process  and starting background service hapttic$<\e[0m"
no_cache = @echo "\e[1;34musing --no-cache build $<\e[0m"
move_file = @echo "\e[1;32mrunning go mod init and copying files $< to $@\e[0m"
testing = @echo "\e[1;34mTesting  $<\e[0m"
disabled =  @echo "\e[1;34mRemoving hapttic.service $<\e[0m"
.ONESHELL:
.PHONY: build_api
build_api: docker preflight test_service compose clean 



.PHONY: docker
docker:
	$(build)
# bash git-projects.sh -install-docpht
# bash git-projects.sh -install-hapttic



preflight:
	$(move_file)
	rm /lib/systemd/system/hapttic.service
	rm hapttic/go.mod
	@echo "copying hapttic.service to  /lib/systemd/system"
	cp hapttic.service  /lib/systemd/system/.
	cd hapttic
	go mod init hapttic-alpha
	go build 
	cd ..
	chmod 755 /lib/systemd/system/hapttic.service
	ufw allow 8080/tcp


test_service:
	$(testing)
	systemctl daemon-reload
	systemctl stop hapttic
	systemctl start hapttic
	systemctl status hapttic
	systemctl stop hapttic







.PHONY: compose
compose: 
	$(no_cache)
# sudo docker-compose build --no-cache --force-rm
# sudo docker-compose up -d --force-recreate
# $(shell sudo docker-compose build --no-cache )
# $(shell sudo docker-compose up -d )


.PHONY: clean
clean:
	$(enabled)
	systemctl start hapttic
	@touch .enabled




# .PHONY: remove-service
remove-service:
# systemctl stop hapttic
# systemctl daemon-reload


	$(disabled)

# systemctl start hapttic
# @touch .enabled



