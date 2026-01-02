#!/bin/bash
# OpenAgents Setup Script
# Integrates the OpenAgents repository into the development environment

set -e

echo "Setting up OpenAgents..."

OPENAGENTS_DIR="/opt/openagents"
WORKSPACE_DIR="/workspace"

# Check if OpenAgents is already cloned
if [ ! -d "$OPENAGENTS_DIR" ]; then
    echo "Cloning OpenAgents repository..."
    git clone https://github.com/darrenhinde/OpenAgents "$OPENAGENTS_DIR" 2>/dev/null || {
        echo "Note: OpenAgents repository may not be accessible."
        echo "Creating placeholder directory..."
        mkdir -p "$OPENAGENTS_DIR"
        
        # Create README for placeholder
        cat > "$OPENAGENTS_DIR/README.md" << 'EOFREADME'
# OpenAgents Integration

This directory is reserved for the OpenAgents framework.

## Setup

To install OpenAgents, run:
```bash
git clone https://github.com/darrenhinde/OpenAgents /opt/openagents
cd /opt/openagents
# Follow installation instructions from the repository
```

## Integration

OpenAgents provides additional agent capabilities for:
- Code analysis
- Automated reviews
- Documentation generation
- Testing automation
- Workflow management

EOFREADME
    }
else
    echo "OpenAgents directory already exists at $OPENAGENTS_DIR"
fi

# Install OpenAgents dependencies if available
if [ -d "$OPENAGENTS_DIR" ] && [ -f "$OPENAGENTS_DIR/package.json" ]; then
    echo "Installing OpenAgents npm dependencies..."
    cd "$OPENAGENTS_DIR"
    npm install 2>/dev/null || pnpm install 2>/dev/null || echo "Skipping npm install"
fi

if [ -d "$OPENAGENTS_DIR" ] && [ -f "$OPENAGENTS_DIR/requirements.txt" ]; then
    echo "Installing OpenAgents Python dependencies..."
    pip install -r "$OPENAGENTS_DIR/requirements.txt" 2>/dev/null || echo "Skipping pip install"
fi

# Create symlink to workspace for easy access
if [ -d "$WORKSPACE_DIR" ]; then
    ln -sf "$OPENAGENTS_DIR" "$WORKSPACE_DIR/.openagents" 2>/dev/null || true
    echo "OpenAgents linked to workspace"
fi

# Setup environment variables
cat >> /home/app/.bashrc << 'EOF'

# OpenAgents Environment
export OPENAGENTS_HOME=/opt/openagents
export PATH="$OPENAGENTS_HOME/bin:$PATH"

EOF

echo "OpenAgents setup completed"
