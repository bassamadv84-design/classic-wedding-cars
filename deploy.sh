#!/bin/bash
set -e

MSG=${1:-"Update site"}

echo "Committing..."
git add -A
git commit -m "$MSG"

echo "Pushing to GitHub..."
git remote set-url origin git@github.com:bassamadv84-design/classic-wedding-cars.git
git push origin main

echo "Deploying to server..."
ssh -i ~/.ssh/id_ed25519 root@91.98.169.0 "cd /var/www/classicariii && git pull"

echo ""
echo "Done! Live at https://classicariii.com"
