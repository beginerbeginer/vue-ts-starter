#!/bin/bash
# テンプレートから作成後に一度だけ実行してください。
# 実行後、このスクリプト自体は削除されます。
set -euo pipefail

PROJECT=$(basename "$(git rev-parse --show-toplevel)")

echo "プロジェクト名: $PROJECT"
echo ""

echo "公開設定を選んでください:"
echo "  1) public"
echo "  2) private"
read -rp "選択 [1/2, デフォルト: 1]: " vis_choice
VISIBILITY="public"
if [[ "${vis_choice}" == "2" ]]; then
  VISIBILITY="private"
fi
gh repo edit --visibility "$VISIBILITY"
echo "✅ visibility を $VISIBILITY に設定しました"
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
echo "  GitHub Pages を有効化"
echo "  https://github.com/beginerbeginer/$PROJECT/settings/pages"
echo "  Source: GitHub Actions"
echo ""
echo "  完了後、main への push で CI・CD・自動リリースが稼働します 🚀"
