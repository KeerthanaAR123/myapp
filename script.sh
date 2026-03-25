#!/bin/bash

# Variables
DOCKER_USER="keerthanaar123"
IMAGE_NAME="myapp"
TAG="latest"
CONTAINER_NAME="myapp_container"

echo "🛠️  Building Docker image..."
docker build -t ${IMAGE_NAME}:${TAG} .

echo "🏷️  Tagging image as ${DOCKER_USER}/${IMAGE_NAME}:${TAG}..."
docker tag ${IMAGE_NAME}:${TAG} ${DOCKER_USER}/${IMAGE_NAME}:${TAG}

echo "🔐 Logging in to Docker Hub..."
docker login --username ${DOCKER_USER}

echo "📤 Pushing image to Docker Hub..."
docker push ${DOCKER_USER}/${IMAGE_NAME}:${TAG}

echo "🚀 Stopping and removing old container (if any)..."
docker stop ${CONTAINER_NAME} || true
docker rm ${CONTAINER_NAME} || true

echo "▶️ Running new container..."
docker run -d -p 5000:5000 --name ${CONTAINER_NAME} ${DOCKER_USER}/${IMAGE_NAME}:${TAG}

echo "✅ Done! Your container is running and image pushed to Docker Hub."
