run: pull build-services prepare-mail
	docker-compose up --build

fast: prepare-mail
	docker-compose up --build

pull:
	git submodule update --recursive --remote

build-services:
	cd ZPI-authorize-service && ./gradlew buildUI && ./gradlew bootJar
	cd ZPI-AMS-service && ./gradlew buildUI && ./gradlew bootJar

e2e: pull build-services
	docker-compose up -d
	docker run -it --network="host" -v $(PWD)/ZPI-demo-UI:/cypress -w /cypress cypress/included:8.6.0
	docker-compose down


DMS_GITHUB_URL=https://raw.githubusercontent.com/docker-mailserver/docker-mailserver/master
MAILSERVER_DIR = docker-mailserver

prepare-mail:
	wget -P ${MAILSERVER_DIR} -O setup.sh ${DMS_GITHUB_URL}/setup.sh 
	-docker run --rm -v $(PWD)/${MAILSERVER_DIR}/docker-data/dms/config/:/tmp/docker-mailserver/ docker.io/mailserver/docker-mailserver setup email add admin@zpi.com admin
	-docker run --rm -v $(PWD)/${MAILSERVER_DIR}/docker-data/dms/config/:/tmp/docker-mailserver/ docker.io/mailserver/docker-mailserver setup email add user@zpi.com admin
