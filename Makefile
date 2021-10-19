run: pull build-services
	docker-compose up --build

pull:
	git submodule update --recursive --remote

build-services:
	cd ZPI-authorize-service && ./gradlew buildUI && ./gradlew bootJar
	cd ZPI-AMS-service && ./gradlew bootJar