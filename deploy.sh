#!/usr/bin/env bash
# Deploy the GWT Hardwood Floors static site to a Linux server over SSH.
#
# Usage:
#   ./deploy.sh user@your-server-ip
#
# Or set defaults below and run with no arguments.
# Requires: rsync + ssh access to the server.

set -euo pipefail

# ---- Config (edit these or pass user@host as the first argument) -----------
REMOTE="${1:-deploy@your-server-ip}"          # SSH target
REMOTE_DIR="/var/www/gwthardwoodfloors.com"   # Web root on the server
LOCAL_DIR="$(cd "$(dirname "$0")/.." && pwd)" # Project root (parent of deploy/)

echo "Deploying GWT Hardwood Floors"
echo "  from: $LOCAL_DIR"
echo "  to:   $REMOTE:$REMOTE_DIR"
echo

# ---- Sync ------------------------------------------------------------------
# --delete keeps the server identical to local (removes stale files).
# Excludes dev/deploy files so only the live site is uploaded.
rsync -avz --delete \
  --exclude 'deploy/' \
  --exclude 'README.md' \
  --exclude '.git/' \
  --exclude '.DS_Store' \
  "$LOCAL_DIR/" "$REMOTE:$REMOTE_DIR/"

echo
echo "Done. If permissions need fixing on the server, run:"
echo "  ssh $REMOTE 'sudo chown -R www-data:www-data $REMOTE_DIR'"
echo "Then reload Nginx if you changed config:"
echo "  ssh $REMOTE 'sudo nginx -t && sudo systemctl reload nginx'"
