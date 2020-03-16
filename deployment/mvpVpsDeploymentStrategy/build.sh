#!/bin/bash

cd ../../WheelBoostBackend || return
python3 -m venv venv
pip install -r req.txt
python3 manage.py makemigrations
python3 manage.py migrate

cd ../../WheelBoostBot || return
python3 -m venv venv
pip install -r req.txt
python3 manage.py makemigrations
python3 manage.py migrate
