#!/usr/bin/env bash
set -euo pipefail

# 실행 중이면 안전 종료, 없어도 통과
docker compose down || true
