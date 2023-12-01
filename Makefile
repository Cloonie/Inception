DC			=	docker-compose
FILE		=	-f srcs/docker-compose.yml

UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
	DATABASE	=	/home/mliew/data/database
	WEBFILES	=	/home/mliew/data/webfiles
endif
ifeq ($(UNAME), Darwin)
	DATABASE	=	/Users/mliew/data/database
	WEBFILES	=	/Users/mliew/data/webfiles
endif

all: build up

# Builds images defined as services in 'docker-compose.yml'.
build:
	$(DC) $(FILE) build

# Starts services defined in 'docker-compose.yml',
# Option -d is to run it in the background.
up:
	mkdir -p $(DATABASE)
	mkdir -p $(WEBFILES)
	$(DC) $(FILE) up -d

# Stops and removes services defined in 'docker-compose.yml',
# Option -v is to remove the volumes along with the containers and networks.
down:
	$(DC) $(FILE) down

# Stops all containers, removes all docker containers, images, volumes, networks.
clean:
	docker stop $$(docker ps -qa) || true
	docker rm $$(docker ps -qa) || true
	docker rmi -f $$(docker images -qa) || true
	docker volume rm $$(docker volume ls -q) || true
	docker network rm $$(docker network ls -q) || true

# Removes local wordpress and mariadb files !Use at own Risk!
rm_local:
	rm -rf $(DATABASE)/*
	rm -rf $(WEBFILES)/*

# Rebuilds everything
re: clean build up

# Phony targets are not actual files; instead,
# they are names for tasks that don't represent real files or file patterns.
.PHONY: build up down logs clean all rm_local