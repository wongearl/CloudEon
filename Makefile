
.PHONY: install-yarn
install-yarn:
	sudo apt remove cmdtest
	sudo apt remove yarn
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt-get update
	sudo apt-get install yarn -y
	yarn config set ignore-engines true
.PHONY: mvn-install
mvn-install:
	mvn  clean install  -DskipTests
.PHONY: build-image
build-image:
	cp -r cloudeon-assembly/target/cloudeon-assembly-v1.3.0-release ./docker
	docker build -f docker/Dockerfile  --build-arg CLOUDEON_VERSION=v1.3.0 -t 172.11.0.6:30002/ailink.io/cloudeon:v1.3.0 ./docker