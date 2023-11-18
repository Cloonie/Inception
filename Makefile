# Makefile
.PHONY: all build clean run

all: build run

build:
	docker-compose -f srcs/docker-compose.yml build

run:
	docker-compose -f srcs/docker-compose.yml up -d

clean:
	docker-compose -f srcs/docker-compose.yml down -v

re: clean build run