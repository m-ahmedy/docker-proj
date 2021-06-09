setup:
	python3 -m venv ~/.devops-proj

install:
	pip install --upgrade pip && \
    pip install -r requirements.txt

validate-circleci:
	circleci config process ./.circleci/config.yml

run-circleci-local:
	circleci local execute

lint:
	hadolint Dockerfile
	pylint --disable=R,C,W1203 app.py

all: install lint test
