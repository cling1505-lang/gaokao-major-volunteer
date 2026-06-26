#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

REPO_URL="${UNIVERSITY_INFORMATION_REPO:-https://github.com/CollegesChat/university-information.git}"
BRANCH="${UNIVERSITY_INFORMATION_BRANCH:-generated}"
DEST="${1:-${SKILL_ROOT}/external/university-information}"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required but was not found." >&2
  exit 1
fi

if [ -e "${DEST}" ] && [ ! -d "${DEST}/.git" ]; then
  echo "Destination exists but is not a git checkout: ${DEST}" >&2
  echo "Move or remove it, or pass a different destination path." >&2
  exit 1
fi

if [ -d "${DEST}/.git" ]; then
  git -C "${DEST}" fetch --depth 1 origin "${BRANCH}"
  git -C "${DEST}" checkout "${BRANCH}"
  git -C "${DEST}" reset --hard "origin/${BRANCH}"
else
  mkdir -p "$(dirname "${DEST}")"
  git clone --depth 1 --branch "${BRANCH}" "${REPO_URL}" "${DEST}"
fi

COMMIT="$(git -C "${DEST}" rev-parse HEAD)"
COUNT="$(find "${DEST}/docs/universities" -type f -name '*.md' 2>/dev/null | wc -l | tr -d ' ')"

cat > "${DEST}.sync-info" <<EOF
repo=${REPO_URL}
branch=${BRANCH}
commit=${COMMIT}
synced_at=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
university_markdown_files=${COUNT}
EOF

echo "Synced ${REPO_URL} (${BRANCH})"
echo "Commit: ${COMMIT}"
echo "University markdown files: ${COUNT}"
echo "Destination: ${DEST}"
