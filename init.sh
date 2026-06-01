#!/bin/bash
# テンプレートから作成後に一度だけ実行してください。
# 実行後、このスクリプト自体は削除されます。
set -euo pipefail

PROJECT=$(basename "$(git rev-parse --show-toplevel)")

echo "プロジェクト名: $PROJECT"
echo ""

# PROJECT_NAME プレースホルダーを実際の名前に置換
sed -i '' "s/PROJECT_NAME/$PROJECT/g" \
  package.json \
  CLAUDE.md \
  index.html \
  vite.config.ts \
  src/App.vue \
  src/views/VHome.vue

echo "✅ プレースホルダーを置換しました"

# 依存インストール（git hooks も設定される）
npm install
echo "✅ npm install 完了"

# init.sh 自体を削除してコミット
rm -- "$0"
git add -A
git commit -m "chore: initialize $PROJECT from vue-ts-starter"
git push
echo "✅ 初期コミット完了"

echo ""
echo "📋 残り手順（手動）:"
echo ""
echo "  1. RELEASE_TOKEN（PAT）を設定"
echo "     - Dashlane から Fine-grained PAT を取得"
echo "       権限: Contents(read/write) + Pull requests(read/write)"
echo "     - gh secret set RELEASE_TOKEN"
echo ""
echo "  2. GitHub Pages を有効化"
echo "     https://github.com/beginerbeginer/$PROJECT/settings/pages"
echo "     Source: GitHub Actions"
echo ""
echo "  完了後、main への push で CI・CD・自動リリースが稼働します 🚀"
