build = @echo "\e[1;35mBuilding docker image $<\e[0m"
enabled = @echo "\e[1;31madding .enabled file to keep track of installing process $<\e[0m"

.PHONY: build_api
build_api: docker clean

.PHONY: docker
docker:
	$(build)
	bash helper.sh -install-docpht



.PHONY: clean
clean:
	$(enabled)
	@touch .enabled

