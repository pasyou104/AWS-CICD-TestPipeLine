#!/usr/bin/env bash
set -euo pipefail

cd /opt/app

# .env 로드 (IMAGE_TAG, ECR_REPO)
if [ -f .env ]; then
  set -a
  . ./.env
  set +a
fi

# 최신 이미지 풀 & 기동
docker compose pull
docker compose up -d
