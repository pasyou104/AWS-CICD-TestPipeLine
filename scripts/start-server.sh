#!/usr/bin/env bash
set -euo pipefail

cd /opt/app
set -a; [ -f .env ] && source .env; set +a   # ECR_REPO, IMAGE_TAG 주입
: "${ECR_REPO:?ECR_REPO missing}"
TAG="${IMAGE_TAG:-latest}"                   # 없으면 latest 사용

docker pull "${ECR_REPO}:${TAG}"
docker compose -f docker-compose.yml up -d --force-recreate
