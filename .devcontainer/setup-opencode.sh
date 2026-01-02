#!/bin/bash
# OpenCode Installation and Setup Script
# This script is called during devcontainer build

set -e

echo "Installing OpenCode AI Platform..."

# Install OpenCode globally
if command -v curl &> /dev/null; then
    echo "Attempting OpenCode installation..."
    curl -fsSL https://opencode.ai/install 2>/dev/null | bash || {
        echo "Note: OpenCode installation URL may not be active yet."
        echo "The installation will be attempted when the container starts."
        echo "You can manually run: curl -fsSL https://opencode.ai/install | bash"
    }
else
    echo "curl is not available. Skipping OpenCode installation."
fi

# Setup OpenCode configuration
if [ -f "/workspace/.opencode.yml" ]; then
    echo "OpenCode configuration found at /workspace/.opencode.yml"
    
    # Create global config directory
    mkdir -p /home/app/.config/opencode
    
    # Link configuration
    ln -sf /workspace/.opencode.yml /home/app/.config/opencode/config.yml 2>/dev/null || true
    
    echo "OpenCode configuration linked successfully"
fi

# Setup environment variables for OpenCode
cat >> /home/app/.bashrc << 'EOF'

# OpenCode Environment
export OPENCODE_HOME=/home/app/.config/opencode
export OPENCODE_AGENTS_PATH=/workspace/.github/agents
export OPENCODE_SKILLS_PATH=/workspace/.github/skills
export OPENCODE_WORKFLOWS_PATH=/workspace/.github/workflows

# Add OpenCode to PATH if installed
if [ -d "/usr/local/opencode/bin" ]; then
    export PATH="/usr/local/opencode/bin:$PATH"
fi

EOF

echo "OpenCode setup script completed"
