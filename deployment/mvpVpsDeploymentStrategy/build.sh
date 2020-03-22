#!/bin/bash

cd ../../WheelBoostBackend || (printf "Error! No ../../WheelBoostBackend folder found."; exit)
python3 -m venv venv
pip3 install -r req.txt
python3 manage.py makemigrations
python3 manage.py migrate

read -r -p "Bot token: " token
read -r -p "Bot port: " bot_port
read -r -p "Backend port: " backend_port
export BOT_URL=localhost:${bot_port}
export TOKEN=${token}
export EVENTS_URL=localhost:${backend_port}
export MAP_URL=https://yandex.ru/maps?

[ -e ../deployment/mvpVpsDeploymentStrategy/run.sh ] && rm ../deployment/mvpVpsDeploymentStrategy/run.sh
echo "nohup ../../WheelBoostBackend/manage.py runserver ${backend_port} &" >> ../deployment/mvpVpsDeploymentStrategy/run.sh
echo "nohup ../../WheelBoostBot/manage.py runserver ${bot_port} &" >> ../deployment/mvpVpsDeploymentStrategy/run.sh

[ -e ../deployment/mvpVpsDeploymentStrategy/monitor.sh ] && rm ../deployment/mvpVpsDeploymentStrategy/monitor.sh
echo "lsof -i :${backend_port}" >> ../deployment/mvpVpsDeploymentStrategy/monitor.sh
echo "lsof -i :${bot_port}" >> ../deployment/mvpVpsDeploymentStrategy/monitor.sh

cd ../WheelBoostBot || (printf "Error! No ../../WheelBoostBot folder found."; exit)
python3 -m venv venv
pip3 install -r req.txt

