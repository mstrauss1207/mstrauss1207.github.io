#!/bin/bash

# Quick Deploy Script for mstrauss.com
# This script uncomments the selected papers section and pushes to GitHub

cd "$(dirname "$0")"

echo "Preparing site for deployment..."

# Uncomment the selected papers section
sed -i.bak 's/<!-- UNCOMMENT THIS WHEN DEPLOYING WITH GITHUB ACTIONS://' _layouts/about.liquid
sed -i.bak 's/-->//' _layouts/about.liquid

echo "✓ Selected papers section enabled"
echo ""
echo "Files ready for deployment!"
echo "Run: git add . && git commit -m 'Deploy with selected papers' && git push"
echo ""
echo "After pushing, enable GitHub Actions in Settings → Pages → Source → GitHub Actions"

