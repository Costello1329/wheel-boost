#!/bin/bash

cd ../../WheelBoostBackend || (printf "Error! No ../../WheelBoostBackend folder found."; exit)
python3 -m venv venv
pip install -r req.txt
python3 manage.py makemigrations
python3 manage.py migrate

read -r -p "Bot token: " token
read -r -p "Bot port: " bot_port
read -r -p "Backend port: " backend_port
export BOT_URL=localhost:${bot_port}
export TOKEN=${token}
export EVENTS_URL=localhost:${backend_port}
export MAP_URL=https://yandex.ru/maps?

cd ../../WheelBoostBot || (printf "Error! No ../../WheelBoostBot folder found."; exit)
python3 -m venv venv
pip install -r req.txt
python3 manage.py makemigrations
python3 manage.py migrate
