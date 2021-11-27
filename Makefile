run: 
	docker-compose up --build

pull:
	git submodule update --recursive --remote

e2e: pull build-services
	docker-compose up -d
	docker run -it --network="host" -v $(PWD)/ZPI-demo-UI:/cypress -w /cypress cypress/included:8.6.0
	docker-compose down

cert:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout proxy/zpi.com.key -out proxy/zpi.com.crt
