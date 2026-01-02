#!/bin/bash
set -e

echo "Running post-start setup..."

# Ensure environment variables are set
export NVM_DIR="/home/app/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Display environment info
echo "==================================="
echo "Development Environment Information"
echo "==================================="
echo "User: $(whoami)"
echo "Working Directory: $(pwd)"
echo ""

# Verify key tools
if command -v node &> /dev/null; then
    echo "Node.js: $(node --version)"
fi

if command -v npm &> /dev/null; then
    echo "npm: $(npm --version)"
fi

if command -v pnpm &> /dev/null; then
    echo "pnpm: $(pnpm --version)"
fi

if command -v python &> /dev/null; then
    echo "Python: $(python --version)"
fi

if command -v cargo &> /dev/null; then
    echo "Rust: $(rustc --version 2>/dev/null || echo 'rustc not in PATH')"
    echo "Cargo: $(cargo --version)"
fi

if command -v conda &> /dev/null; then
    echo "Conda: $(conda --version)"
fi

if command -v docker &> /dev/null; then
    echo "Docker: $(docker --version)"
fi

echo "==================================="
echo ""
echo "✅ Development container is ready!"
echo ""
