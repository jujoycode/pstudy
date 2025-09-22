#!/bin/bash
set -e

echo "🦀 Setting up Rust PS + Node.js CLI Tools environment..."

# Rust 기본 컴포넌트 설치
echo "🔧 Setting up Rust components..."
rustup component add clippy rustfmt rust-src

# Node.js 및 pnpm 설정
echo "📦 Setting up Node.js and pnpm..."

# pnpm 전역 설치
npm install -g pnpm@latest

# PNPM_HOME 환경 변수 설정
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# pnpm 디렉토리 생성
mkdir -p "$PNPM_HOME"

# pnpm setup 실행
pnpm setup

# 환경 변수를 bashrc에 추가
echo "export PNPM_HOME=\"\$HOME/.local/share/pnpm\"" >> ~/.bashrc
echo "export PATH=\"\$PNPM_HOME:\$PATH\"" >> ~/.bashrc

# 현재 세션에 적용
. ~/.bashrc

# CLI 도구 개발에 유용한 전역 패키지들 (로컬 설치로 변경)
echo "\n🛠️  Installing Dependencies...\n"
cd ./templates/boj-template-generator

pnpm install

# 원래 디렉토리로 돌아가기
cd -

# Rust 도구들 설치
echo "\n🦀 Installing Rust tools for PS...\n"
cargo install cargo-watch         # 자동 빌드/테스트
cargo install cargo-edit          # Cargo.toml 편집
cargo install cargo-tree          # 의존성 트리
cargo install cargo-expand        # 매크로 전개 확인

# 알고리즘/자료구조 학습에 유용한 도구
echo "🧮 Installing tools for algorithm study..."
# cargo install cargo-criterion  # 벤치마킹 (필요시 주석 해제)

# 편리한 alias 설정
echo "⚙️ Setting up convenient aliases..."
cat >> ~/.bashrc << 'EOF'

# Rust PS용 편리한 alias들
alias cr='cargo run'
alias ct='cargo test'
alias cw='cargo watch -x run'
alias cwt='cargo watch -x test'
alias cb='cargo build'
alias cc='cargo check'
alias cf='cargo fmt'
alias cl='cargo clippy'

# 빠른 프로젝트 생성
alias cnew='cargo new --bin'
alias clib='cargo new --lib'

# Node.js/pnpm alias (CLI 도구 중심)
alias pn='pnpm'
alias pni='pnpm install'
alias pnr='pnpm run'
alias pnd='pnpm run dev'
alias pnb='pnpm run build'
alias pnt='pnpm test'

# CLI 도구 실행 및 테스트
alias get-problem='cd templates/boj-template-generator && pnpm run get-problem'
alias watch-ts='npx nodemon --exec "npx tsx"'
alias build-cli='pnpm run build'
alias test-cli='node dist/index.js'

# 유틸리티 명령어들
alias json='python3 -m json.tool'  # JSON 포맷팅
alias uuid='node -e "console.log(require(\"crypto\").randomUUID())"'  # UUID 생성

# 디렉토리 이동 단축키
alias home='cd /workspaces/pstudy'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -la'
alias la='ls -A'
EOF

# Git 기본 설정
echo "🔧 Setting up Git..."
git config --global init.defaultBranch main
git config --global pull.rebase true

# PS용 기본 .gitignore 생성 (루트에 없을 경우)
if [ ! -f .gitignore ]; then
    echo "📝 Creating .gitignore..."
    cat > .gitignore << 'EOF'
# Rust
/target/
Cargo.lock

# IDE
.vscode/settings.json
.idea/

# OS
.DS_Store
Thumbs.db

# PS specific
/solutions/
/temp/
*.tmp
EOF
fi

echo "\n\n✅ Rust PS environment setup complete!"
echo ""
echo "🚀 Quick start commands:"
echo "  cr      - cargo run"
echo "  ct      - cargo test"
echo "  cw      - cargo watch -x run (auto reload)"
echo "  cwt     - cargo watch -x test (auto test)"
echo "  cnew    - cargo new --bin <name>"
echo ""
echo "\n\n📋 Environment info:"
rustc --version
cargo --version