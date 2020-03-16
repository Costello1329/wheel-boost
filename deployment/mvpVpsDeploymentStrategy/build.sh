#!/bin/bash

cd ../../WheelBoostBackend || printf "Error! No ../../WheelBoostBackend folder found." ; exit
python3 -m venv venv
pip install -r req.txt
python3 manage.py makemigrations
python3 manage.py migrate

read -r -p "Bot token: " token
read -r -p "Bot url: " bot_url
read -r -p "Bot port: " bot_port
read -r -e -p "Backend url: " -i "localhost" backend_port
read -r -p "Backend port: " backend_port
read -r -e -p "Maps url: " -i "https://yandex.ru/maps?" maps_url
echo "export BOT_URL=${bot_url}" > run.sh
echo "export TOKEN=${token}" >> run.sh
echo "export EVENTS_URL=${backend_url}" >> run.sh
echo "export MAP_URL=${maps_url}" >> run.sh

cd ../../WheelBoostBot || printf "Error! No ../../WheelBoostBot folder found." ; exit
python3 -m venv venv
pip install -r req.txt
python3 manage.py makemigrations
python3 manage.py migrate
