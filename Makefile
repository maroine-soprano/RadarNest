# Variables
DOCKER_COMPOSE = docker-compose
MONGO_CONTAINER = mongodb-container
DB_NAME = radar
USERS_JSON = users.json
ACCOUNTS_JSON = accounts.json

# Targets
.PHONY: up downloadModel verify down

downloadModel:
	mkdir -p models
	curl -L -o models/mistral-7b-instruct-v0.2.Q4_K_M.gguf "https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.2-GGUF/resolve/main/mistral-7b-instruct-v0.2.Q4_K_M.gguf?download=true"

up:
	# Remove existing containers
	docker container rm -f mongodb-container
	docker container rm -f radar-backend-container
	docker container rm -f radar-frontend-container
	# Start the python app
	python3 -m venv venv
	pip3 install -r requirements.txt
	uvicorn main:app --reload --port 8000 &
	# Start the MongoDB, Frontend, and Backend
	$(DOCKER_COMPOSE) up -d
	# Import JSON files into MongoDB
	docker cp ./database/$(USERS_JSON) mongodb-container:/data/$(USERS_JSON)
	docker cp ./database/$(ACCOUNTS_JSON) mongodb-container:/data/$(ACCOUNTS_JSON)
	docker exec -it $(MONGO_CONTAINER) mongoimport --db $(DB_NAME) --collection users --file /data/$(USERS_JSON) --jsonArray
	docker exec -it $(MONGO_CONTAINER) mongoimport --db $(DB_NAME) --collection accounts --file /data/$(ACCOUNTS_JSON) --jsonArray

# Verify the data in MongoDB
verify:
	docker exec -it $(MONGO_CONTAINER) mongosh $(DB_NAME) --eval "use $(DB_NAME); db.users.find().limit(5).pretty(); db.accounts.find().pretty();"

down:
	$(DOCKER_COMPOSE) down
