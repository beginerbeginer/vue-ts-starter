# vue-ts-starter

Vue 3 + TypeScript + Vite のスターターテンプレート。

CI/CD（GitHub Actions）・自動リリース（release-please）・Linter・Claude Code スキルが最初から設定済み。

## 含まれるもの

| 機能 | 内容 |
|------|------|
| CI | lint / type-check / unit test / integration test / build |
| CD | GitHub Pages への自動デプロイ |
| 自動リリース | release-please による CHANGELOG・GitHub Release 自動生成 |
| Linter | ESLint + Prettier + commitlint |
| Git フック | pre-commit（lint-staged）、commit-msg（commitlint）、pre-push（Playwright） |
| Claude Code | CI デバッグ・TDD・Vue コンポーネント設計などのスキル |

## 5 分セットアップ

### 1. テンプレートからリポジトリを作成

```bash
gh repo create beginerbeginer/my-app \
  --template beginerbeginer/vue-ts-starter \
  --private \
  --clone
cd my-app
```

### 2. 初期化スクリプトを実行（〜1 分）

```bash
bash init.sh
```

プレースホルダー置換・npm install・初期コミット・push を自動で行います。

### 3. GitHub Pages を有効化（〜30 秒）

リポジトリの Settings → Pages → Source: **GitHub Actions** に設定。

---

これで完了です。`main` への push で CI・CD・自動リリースが動き始めます。

## 技術スタック

- [Vue 3](https://vuejs.org/) + [TypeScript](https://www.typescriptlang.org/) + [Vite](https://vitejs.dev/)
- [Vuetify 4](https://vuetifyjs.com/)（UI コンポーネント）
- [Pinia](https://pinia.vuejs.org/)（状態管理）
- [Vitest](https://vitest.dev/)（ユニット・インテグレーションテスト）
- [Playwright](https://playwright.dev/)（E2E テスト）
