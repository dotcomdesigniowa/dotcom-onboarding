#!/usr/bin/env bash
# push-company-updates.sh — For Josh: push updated company context to the team
set -e
VAULT_ROOT="$HOME/Desktop/OS"
COMPANY_CONTEXT_SRC="$VAULT_ROOT/Dotcom Design/_context"
AI_PHILOSOPHY_SRC="$VAULT_ROOT/Dotcom Design/company/AI Philosophy.md"
COMPANY_REPO="$HOME/Desktop/dotcom-company-context"
if [ ! -d "$COMPANY_REPO/.git" ]; then
  echo "ERROR: Company repo not found. Clone dotcom-company-context first."
  exit 1
fi
SYNC_FILES=("Ideal Customer Profile.md" "North Star & Goals.md" "Mission Vision Values.md" "Brand Voice Guide.md" "Offers & Services.md" "Team & Org.md")
for f in "${SYNC_FILES[@]}"; do
  src="$COMPANY_CONTEXT_SRC/$f"
  [ -f "$src" ] && cp "$src" "$COMPANY_REPO/$f" && echo "Copied: $f"
done
[ -f "$AI_PHILOSOPHY_SRC" ] && cp "$AI_PHILOSOPHY_SRC" "$COMPANY_REPO/AI Philosophy.md" && echo "Copied: AI Philosophy.md"
cd "$COMPANY_REPO"
git add -A
git diff --staged --quiet 2>/dev/null || { git commit -m "Company context update $(date +%Y-%m-%d)" && git push origin main && echo "Pushed to GitHub"; } || echo "No changes"
