#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

npm run compile

# Increment patch version without creating a git tag.
npm version patch --no-git-tag-version

VERSION=$(node -p "require('./package.json').version")

npx vsce package --no-yarn

code-insiders --install-extension "./hidefiles-${VERSION}.vsix" --force

echo "Installed hidefiles-${VERSION}.vsix"
