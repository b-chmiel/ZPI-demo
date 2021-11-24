run: pull build-services 
	docker-compose up --build

fast: 
	docker-compose up --build

pull:
	git submodule update --recursive --remote

e2e: pull build-services
	docker-compose up -d
	docker run -it --network="host" -v $(PWD)/ZPI-demo-UI:/cypress -w /cypress cypress/included:8.6.0
	docker-compose down

