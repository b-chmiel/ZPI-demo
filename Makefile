run: pull build-services
	docker-compose up

pull:
	git pull --recurse-submodules

build-services:
	cd ZPI-authorize-service && ./gradlew buildUI && ./gradlew bootJar
	cd ZPI-AMS-service && ./gradlew bootJar
	
rebuild: pull build-services 
	docker-compose up --build
