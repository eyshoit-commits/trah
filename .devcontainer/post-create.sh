#!/bin/bash
set -e

echo "Running post-create setup..."

# Run OpenCode setup
if [ -f "/workspace/.devcontainer/setup-opencode.sh" ]; then
    bash /workspace/.devcontainer/setup-opencode.sh
fi

# Run OpenAgents setup
if [ -f "/workspace/.devcontainer/setup-openagents.sh" ]; then
    bash /workspace/.devcontainer/setup-openagents.sh
fi

# Ensure NVM is available
export NVM_DIR="/home/app/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Ensure Node 24 is active
if [ -d "$NVM_DIR" ]; then
    nvm use 24 2>/dev/null || nvm install 24
fi

# Verify installations
echo "Verifying installations..."

# Check Node.js
if command -v node &> /dev/null; then
    echo "✓ Node.js $(node --version) installed"
else
    echo "⚠ Node.js not found"
fi

# Check npm
if command -v npm &> /dev/null; then
    echo "✓ npm $(npm --version) installed"
else
    echo "⚠ npm not found"
fi

# Check pnpm
if command -v pnpm &> /dev/null; then
    echo "✓ pnpm $(pnpm --version) installed"
else
    echo "⚠ pnpm not found, installing..."
    npm install -g pnpm
fi

# Check Python
if command -v python &> /dev/null; then
    echo "✓ Python $(python --version) installed"
else
    echo "⚠ Python not found"
fi

# Check Rust
if command -v rustc &> /dev/null; then
    echo "✓ Rust $(rustc --version) installed"
else
    echo "⚠ Rust not found"
fi

# Check Cargo
if command -v cargo &> /dev/null; then
    echo "✓ Cargo $(cargo --version) installed"
else
    echo "⚠ Cargo not found"
fi

# Check Conda
if command -v conda &> /dev/null; then
    echo "✓ Conda $(conda --version) installed"
else
    echo "⚠ Conda not found"
fi

# Setup OpenAgents if available
if [ -d "/opt/openagents" ]; then
    echo "Setting up OpenAgents..."
    cd /opt/openagents
    # Install dependencies if needed
    if [ -f "package.json" ]; then
        npm install 2>/dev/null || pnpm install 2>/dev/null || echo "OpenAgents npm install skipped"
    fi
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt 2>/dev/null || echo "OpenAgents pip install skipped"
    fi
    cd /workspace
fi

# Initialize custom agents structure
echo "Setting up custom agents, skills, and workflows..."

# Create sample custom agent configuration
mkdir -p /workspace/.github/agents
cat > /workspace/.github/agents/README.md << 'EOF'
# Custom Agents

This directory contains custom agent configurations for the development environment.

## Available Agents

Custom agents will be configured here to assist with development tasks.
EOF

# Create sample GitHub skills
mkdir -p /workspace/.github/skills
cat > /workspace/.github/skills/README.md << 'EOF'
# GitHub Skills

This directory contains GitHub skills configurations.

## Skills

Skills for GitHub automation and development workflows.
EOF

# Setup is complete
echo "✅ Post-create setup completed successfully!"
echo ""
echo "Environment ready with:"
echo "  - Node.js 24 with npm and pnpm"
echo "  - Python 3.12"
echo "  - Rust with cargo"
echo "  - Conda package manager"
echo "  - Docker-in-Docker support"
echo "  - Users: app (active), bkg (with sudo)"
echo "  - OpenCode and OpenAgents integration"
echo ""
