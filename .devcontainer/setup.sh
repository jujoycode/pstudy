#!/bin/bash
set -e

echo "🦀 Setting up Rust PS (Personal Study) environment..."

# Rust 기본 컴포넌트
rustup component add clippy rustfmt rust-src

# PS에 유용한 cargo 도구들
echo "📦 Installing useful cargo tools for PS..."
cargo install cargo-watch      # 자동 빌드/테스트
cargo install cargo-edit       # Cargo.toml 편집
cargo install cargo-tree       # 의존성 트리
cargo install cargo-expand     # 매크로 전개 확인
cargo install cargo-flamegraph # 성능 프로파일링 (Linux)

# 알고리즘/자료구조 학습에 유용한 도구
# echo "🧮 Installing tools for algorithm study..."
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

# 디렉토리 이동 단축키
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

echo "✅ Rust PS environment setup complete!"
echo ""
echo "🚀 Quick start commands:"
echo "  cr      - cargo run"
echo "  ct      - cargo test"
echo "  cw      - cargo watch -x run (auto reload)"
echo "  cwt     - cargo watch -x test (auto test)"
echo "  cnew    - cargo new --bin <name>"
echo ""
echo "📋 Environment info:"
rustc --version
cargo --version