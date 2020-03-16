#!/bin/bash

cd ../../WheelBoostBackend || return
python3 -m venv venv
pip install -r req.txt
python3 manage.py makemigrations
python3 manage.py migrate

read -p "Bot token: " token
read -p "Bot url: " bot_url
read -p "Bot port: " bot_port
read -e -p "Backend url: " -i "localhost" backend_port
read -p "Backend port: " backend_port
read -e -p "Maps url: " -i "https://yandex.ru/maps?" maps_url
echo "export BOT_URL=${bot_url}" > run.sh
echo "export TOKEN=${token}" >> run.sh
echo "export EVENTS_URL=${backend_url}" >> run.sh
echo "export MAP_URL=${maps_url}" >> run.sh

cd ../../WheelBoostBot || return
python3 -m venv venv
pip install -r req.txt
python3 manage.py makemigrations
python3 manage.py migrate
