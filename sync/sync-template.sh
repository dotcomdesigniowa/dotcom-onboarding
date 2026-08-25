#!/usr/bin/env bash
# .sync.sh — Daily backup for [EmployeeName]'s Dotcom Design OS
# Runs via Windows Task Scheduler (or manually any time).
set -e
OS_ROOT="[OS_ROOT_PLACEHOLDER]"
PERSONAL_REMOTE="[PERSONAL_REMOTE_PLACEHOLDER]"
if [ -d "$OS_ROOT/Company" ]; then
  cd "$OS_ROOT"
  if [ -d "$OS_ROOT/Company/.git" ]; then
    cd "$OS_ROOT/Company"
    git pull --quiet 2>/dev/null || echo "[sync] Company pull failed"
    cd "$OS_ROOT"
  fi
fi
cd "$OS_ROOT"
if [ ! -d "$OS_ROOT/.git" ]; then
  git init -q
  git remote add origin "$PERSONAL_REMOTE" 2>/dev/null || true
fi
git add -A
git reset -q -- Company/ 2>/dev/null || true
if ! git diff --staged --quiet 2>/dev/null; then
  git commit -q -m "Daily backup $(date +%Y-%m-%d_%H%M)"
  git push -q origin main 2>/dev/null || echo "[sync] Push failed"
else
  echo "[sync] No changes at $(date)"
fi
