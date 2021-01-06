
sudo docker network create -d bridge --subnet=172.77.0.0/24 network1

sudo docker pull mariadb:10.5.8

sudo docker pull phpmyadmin:5.0.4

sudo docker pull mongo:4.4-bionic

sudo docker run --name mariadb \
	--network=network1 \
	--restart=always \
	-p 3306:3306 \
	-e MYSQL_ROOT_PASSWORD=1234@ \
	-d mariadb:10.5.8

sudo docker run --name pma \
	--network=network1 \
	--restart=always \
	-p 8045:80 \
	--link mariadb:db \
	-d phpmyadmin:5.0.4 

sudo docker run --name mongo \
	--network=network1 \
	--restart=always \
	-p 4545:27017 \
	-e MONGO_INITDB_ROOT_USERNAME=admin \
	-e MONGO_INITDB_ROOT_PASSWORD=1234@ \
	-d mongo:4.4-bionic


