docker run -itd --rm -p 80:80 --network inception --name test nginx

Docker Clean: Stops all containers, removes all containers, removes all images, removes all volumes, removes all networks.
docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q)