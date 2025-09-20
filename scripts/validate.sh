#!/usr/bin/env bash
set -euo pipefail

# 앱이 정상 기동했는지 헬스체크 (포트/경로 필요 시 수정)
curl -fsS http://localhost/health > /dev/null
