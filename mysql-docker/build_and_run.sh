#!/bin/bash
docker build -t mysql-debian .
docker run -d --name mysql_container -p 3306:3306 mysql-debian
