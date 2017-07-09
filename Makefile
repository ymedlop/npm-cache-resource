all: deps

deps:
	@echo "Preparing scenario.."
	mkdir -p keys/web keys/worker
	ssh-keygen -t rsa -f ./keys/web/tsa_host_key -N ''
	ssh-keygen -t rsa -f ./keys/web/session_signing_key -N ''
	ssh-keygen -t rsa -f ./keys/worker/worker_key -N ''
	cp ./keys/worker/worker_key.pub ./keys/web/authorized_worker_keys
	cp ./keys/web/tsa_host_key.pub ./keys/worker

run-simple-linux:
	@echo "Running simple Concourse scenario for Linux.."
	docker-compose -f compose/simple/linux/docker-compose.yml up

stop-simple-linux:
	@echo "Stopping simple Concourse scenario for Linux.."
	docker-compose -f compose/simple/linux/docker-compose.yml down

run-private-registry-linux:
	@echo "Running private registry scenario for Linux.."
	docker-compose -f compose/private-registry/linux/docker-compose.yml up

stop-private-registry-linux:
	@echo "Stopping private registry Concourse scenario for Linux.."
	docker-compose -f compose/private-registry/linux/docker-compose.yml down

run-simple-osx:
	@echo "Running simple Concourse scenario for OSX.."
	docker-compose -f compose/simple/osx/docker-compose.yml up

stop-simple-osx:
	@echo "Stopping simple Concourse scenario for OSX.."
	docker-compose -f compose/simple/osx/docker-compose.yml down

run-private-registry-osx:
	@echo "Running private registry scenario for OSX.."
	docker-compose -f compose/private-registry/osx/docker-compose.yml up

stop-private-registry-osx:
	@echo "Stopping private registry Concourse scenario for OSX.."
	docker-compose -f compose/private-registry/osx/docker-compose.yml down