#!/bin/bash

# Step 1: Create Dockerfile
cat > Dockerfile <<DOCKER
FROM python:3.9-slim

ENV APP_ENV=prod
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000
CMD ["python", "app.py"]
DOCKER

# Step 2: Build Docker image
docker build -t flask-docker-image .

# Step 3: Run Docker container
docker run -d -p 5000:5000 flask-docker-image
