#!/bin/bash

set -e

# Variables
REGION="ap-south-1"
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REPO_NAME="python-microservice"
ECR_URL="${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPO_NAME}"
TAG="latest"

# Build Docker image
echo "🚧 Building Docker image..."
docker build -t ${REPO_NAME} .

# Authenticate Docker with ECR
echo "🔐 Logging into ECR..."
aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com

# Tag image
echo "🏷️ Tagging image with ECR URL..."
docker tag ${REPO_NAME}:${TAG} ${ECR_URL}:${TAG}

# Push to ECR
echo "📤 Pushing Docker image to ECR..."
docker push ${ECR_URL}:${TAG}

echo "✅ Image pushed successfully: ${ECR_URL}:${TAG}"
echo "🚀 Deployment complete!" 